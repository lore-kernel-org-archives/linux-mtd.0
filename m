Received: from mail.mediatrix.com ([205.237.248.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157Kpx-00053v-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 18:41:50 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D995486@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: erasesize 
Date: Tue, 5 Jun 2001 13:40:38 -0400 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

fgiasson@mediatrix.com said:
>  Therefore, this is why I think that the length of the block to erase
> whould be passed by the user. At least, this is what the code suggest.

That's correct. The user should pass the length of the region to erase.

For example, if you have a chip which has 8 * 8K regions, then 15 * 64K, 
the user may request that you erase 72K starting at offset 56K. That would 
require the magic incantation to be issued once at offset 56K to erase that 
8K block, and once at offset 64K to erase that 64K block.

--
dwmw2


We agree on that.  Now I am questionning on the portabilty of the piece of
code below
( which belongs to cfi_amdstd_erase_varsize() ) between different CFI ( and
maybe even non-cfi ) flashes.  
There is the reasons of my concern:


    if( instr->addr > mtd->size )
    {
        printk( "cfi_amdstd_erase_varsize: Requested erase region begining
out of range!\n" );
        printk( "instr->addr: %X, mtd->size: %d\n", instr->addr, mtd->size
);
		return -EINVAL;
    }

	if( ( instr->len + instr->addr ) > mtd->size )
    {
        printk( "cfi_amdstd_erase_varsize: Requested erase region end out of
range!\n" );
        printk( "instr->len: %X instr->addr: %X, mtd->size: %d\n",
instr->len, instr->addr, mtd->size );
        return -EINVAL;
    }


	/* Check that both start and end of the requested erase are
	 * aligned with the erasesize at the appropriate addresses.
	 */
	/* Skip all erase regions which are ended before the start of 
	   the requested erase. Actually, to save on the calculations,
	   we skip to the first erase region which starts after the
	   start of the requested erase, and then go back one.
	*/
	i = 0;
    while( ( i < mtd->numeraseregions ) && ( instr->addr >=
regions[i].offset ) )
    {
	       i++;
    }
	i--;

	/* OK, now i is pointing at the erase region in which this 
	   erase request starts. Check the start of the requested
	   erase range is aligned with the erase size which is in
	   effect here.
	*/
    if( instr->addr & ( regions[i].erasesize - 1 ) )
    {
        printk( "cfi_amdstd_erase_varsize: Erase region begin address as to
be aligned with physical sector.\n" );
		return -EINVAL;
    }


	/* Remember the erase region we start on */
	first = i;
	/* Next, check that the end of the requested erase is aligned
	 * with the erase region at that address.
	 */
	while( ( i < mtd->numeraseregions ) && ( (instr->addr + instr->len)
>= regions[i].offset ) )
    {
		i++;
    }
	/* As before, drop back one to point at the region in which
	   the address actually falls
	*/
	i--;

    if( (instr->addr + instr->len) & (regions[i].erasesize-1) )
    {
        printk( "cfi_amdstd_erase_varsize: End address is not aligned with
the region requested to be erased.\n" );
		return -EINVAL;
    }


        

Those 2 instructions ( from the code above)

    if( instr->addr & ( regions[i].erasesize - 1 ) )
	{
		[return error]
	}

and

    if( (instr->addr + instr->len) & (regions[i].erasesize-1) )
	{
		[return error]
	}

, which job are to ensure respectively that the start address of the block
to be erased is aligned
with the start of a physical sector, and that the instr->len is in a way so
that the block ends at
the very end of a physical sector, not a byte more or less.  

	With my flash ( Atmel, which is not CFI )  and probably most of the
existing flash memories on the market, 
it does the job.  However, it assumes 2 things:
	- sectors must have power-2 sizes 
	- sectors must be aligned on a multiple of their own size. 

	For example, a 32KB sector beggining at address 24KB wouldn't be OK.
I never seen a flash physically mapped in 
such a way, but maybe it is not always the case ( someone has the answer??
).

	
Whatever that answer would be, it would be safer to do as the code below
does:

    // Searching for a sector that begins at the starting address of the
block 
    // requested to be erased
    while( ( i < mtd->numeraseregions ) && ( instr->addr !=
regions[i].offset ) )
    {
		i++;
    }


	/* Remember the erase region we start on */
	first = i;

    // Searching for a sector that ends exactly at the last address of the
block 
    // requested to be erased
    while( 
            ( i < mtd->numeraseregions ) && 
            ( 
              ( instr->addr + instr->len ) != 
              ( regions[i].offset + regions[i].erasesize )
            )
         )
    {
	       i++;
    }
	
This would be safer, without taking longer to execute.
Anyone disagree?


Frédéric Giasson
