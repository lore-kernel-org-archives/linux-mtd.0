Received: from crystal.2d3d.co.za ([196.14.185.203] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 157vcn-0007Gy-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Jun 2001 09:58:42 +0100
Date: Thu, 7 Jun 2001 11:04:00 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: HELP
Message-ID: <20010607110359.A22278@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
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

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I'm busy debugging my chip driver for 28Fxx... chips in LART and I got this
problem with one of my tests:

------------< snip <------< snip <------< snip <------------
root@tinystor:~# ./mtd_debug write 2 6 /dev/zero
MTD_open
MTD_write
flash_write(to =3D 0x00000002, len =3D 6)
write_dword(): 0x00000000 <- 0x0000ffff
mtd_debug: Unaligned memory access at pc=3D0xca005644, lr=3D0xc001dc08 (bad
address=3D0xc0135d82, cod)
Internal error: alignment exception: 0
CPU: 0
pc : [<ca005644>]    lr : [<c001dc08>]
sp : c9635f10  ip : c9635f54  fp : c9635f44
r10: c0135d82  r9 : 00000000  r8 : 00000004
r7 : c0135d82  r6 : 00000002  r5 : 00000004  r4 : 00000000
r3 : 00000002  r2 : 00000004  r1 : ca005adc  r0 : ca005ac0
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: C075117F  Table: C075117F  DAC: 00000015
Process mtd_debug (pid: 273, stackpage=3Dc9635000)
Code: e59f10c0 e1a02008 (e49a3004) e2455004 eb00020f
Stack:
c9635f00: c001dc08 ca005644 20000013 ffffffff  00000002 00000000 0000ffff
00000006
c9635f20: c0135d80 00000000 00000006 c00116e0  c011bec0 0200d800 c9635f80
c9635f48
c9635f40: ca002648 ca0054b0 c9635f54 c0135d80  00000000 00000002 c00116c0
ffffffea
c9635f60: 00000000 00000006 0200d800 00000004  bfffff30 c9635fac c9635f84
c003f48c
c9635f80: ca0024e4 c00180bc c003ee5c 0200d800  0200d810 20000010 00000002
c0012804
c9635fa0: 00000000 c9635fb0 c0012680 c003f3bc  0200d800 c0018690 00000003
0200d800
c9635fc0: 00000006 ffffffff 0200d800 0200d810  00000006 00000002 00000003
400fe248
c9635fe0: bfffff30 bffffdcc 400abaa0 bffffda8  02000b48 400abaa4 20000010
00000003
Backtrace:
Function entered at [<ca0054a4>] from [<ca002648>]
Function entered at [<ca0024d8>] from [<c003f48c>]
Function entered at [<c003f3b0>] from [<c0012680>]
 r8 =3D C0012804  r7 =3D 00000002  r6 =3D 20000010  r5 =3D 0200D810
 r4 =3D 0200D800
Segmentation fault
root@tinystor:~#
------------< snip <------< snip <------< snip <------------

All that the test program in this case is doing is writing 6 bytes starting
at offset 2 in /dev/mtd0 to /dev/mtd0 (damn, this sounds confusing). Here is
the test procedure:

------------< snip <------< snip <------< snip <------------
void file_to_flash (int fd,u_int32_t offset,u_int32_t len,const char
*filename)
{
   u_int8_t *buf;
   FILE *fp;
   int err;
   if (offset !=3D lseek (fd,offset,SEEK_SET))
     {
        perror ("lseek()");
        return;
     }
   if ((buf =3D (u_int8_t *) malloc (len * sizeof (u_int8_t))) =3D=3D NULL)
     {
        perror ("malloc()");
        return;
     }
   if ((fp =3D fopen (filename,"r")) =3D=3D NULL)
     {
        perror ("fopen()");
        free (buf);
        return;
     }
   if (fread (buf,len,1,fp) !=3D 1 || ferror (fp))
     {
        perror ("fread()");
        free (buf);
        fclose (fp);
        return;
     }
   err =3D write (fd,buf,len);
   if (err < 0)
     {
        perror ("write()");
        free (buf);
        fclose (fp);
        return;
     }
   free (buf);
   fclose (fp);
   printf ("Copied %d bytes from %s to address 0x%.8x in
flash\n",len,filename,offset);
}
------------< snip <------< snip <------< snip <------------

Above function is called with an open file descriptor to /dev/mtd0, offset =
=3D
2, len =3D 6, and the source file is /dev/zero

As you can see from the fault that occurred, above function obviously
reached the write(), so I doubt there's anything wrong with the function
above (after I can't see anything that might be unaligned in there)

Now the chip driver which is used by /dev/mtd0 is a dummy driver which fakes
the write and just shows you what it would do (hence the write_dword():
0x00000000 <- 0x0000ffff)

Below is the relevant module code:

------------< snip <------< snip <------< snip <------------
static int flash_write (struct mtd_info *mtd,loff_t to,size_t len,size_t
*retlen,const u_char *buf)
{
   __u8 tmp[4];
   int i,n;

#ifdef LART_DEBUG
   printk (KERN_DEBUG "%s(to =3D 0x%.8x, len =3D %d)\n",__FUNCTION__,(__u32)
to,len);
#endif

   *retlen =3D 0;

   /* sanity checks */
   if (!len) return (0);
   if (to + len > mtd->size) return (-EINVAL);

   /* first, we write a 0xFF.... padded byte until we reach a dword boundary
*/
   if (to & (BUSWIDTH - 1))
     {
        __u32 aligned =3D to & ~(BUSWIDTH - 1);
        int gap =3D to - aligned;

        i =3D n =3D 0;

        while (gap--) tmp[i++] =3D 0xFF;
        while (len && i < BUSWIDTH) tmp[i++] =3D buf[n++], len--;
        while (i < BUSWIDTH) tmp[i++] =3D 0xFF;

        if (!write_dword (aligned,*((__u32 *) tmp))) return (-EIO);

        to +=3D n;
        buf +=3D n;
        *retlen +=3D n;
     }

   /* now we write dwords until we reach a non-dword boundary */
   while (len >=3D BUSWIDTH)
     {
        if (!write_dword (to,*((__u32 *) buf))) return (-EIO);

        to +=3D BUSWIDTH;
        buf +=3D BUSWIDTH;
        *retlen +=3D BUSWIDTH;
        len -=3D BUSWIDTH;
     }

   /* top up the last unaligned bytes, padded with 0xFF.... */
   if (len & (BUSWIDTH - 1))
     {
        i =3D n =3D 0;

        while (len--) tmp[i++] =3D buf[n++];
        while (i < BUSWIDTH) tmp[i++] =3D 0xFF;

        if (!write_dword (to,*((__u32 *) tmp))) return (-EIO);

        *retlen +=3D n;
     }

   return (0);
}

static inline int write_dword (__u32 offset,__u32 x)
{
#ifndef LART_DEBUG
   __u32 status;

   /* setup writing */
   write32 (data_to_flash (PGM_SETUP),offset);

   /* write the data */
   write32 (x,offset);

   /* wait for the write to finish */
   do
     {
        write32 (data_to_flash (STATUS_READ),offset);
        status =3D flash_to_data (read32 (offset));
     }
   while ((~status & STATUS_BUSY) !=3D 0);

   /* put the flash back into command mode */
   write32 (data_to_flash (READ_ARRAY),offset);

   /* was the write successfull? */
   if ((status & STATUS_PGM_ERR) || read32 (x) !=3D x)
     {
        printk (KERN_WARNING "%s: write error at address
0x%.8x.\n",module_name,offset);
        return (0);
     }
#else
   printk (KERN_DEBUG "%s(): 0x%.8x <- 0x%.8x\n",__FUNCTION__,offset,x);
#endif

   return (1);
}
------------< snip <------< snip <------< snip <------------

LART_DEBUG is of course defined. As you can see from the output, the first
if() was executed successfully and then it crashed in the while loop (at
offset 2, there's a padded word and a dword that needs to be written. The
dword get's caught be the while loop).

What I don't get is why I get an "Unaligned memory access" since all the
data I'm using should be aligned correctly by the compiler. Also a similar
test that tests the dword while loop works perfectly:

------------< snip <------< snip <------< snip <------------
root@tinystor:~# ./mtd_debug write 4 6 /dev/zero
MTD_open
MTD_write
flash_write(to =3D 0x00000004, len =3D 6)
write_dword(): 0x00000004 <- 0x00000000
write_dword(): 0x00000008 <- 0xffff0000
Copied 6 MTD_close
bytes from /dev/zero to address 0x00000004 in flash
root@tinystor:~#
------------< snip <------< snip <------< snip <------------

Any help would really be appreciated.

--=20

Regards
 Abraham

Love is never asking why?

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7H0N/zNXhP0RCUqMRAs0hAJ9xIfMcOHzwhU22ocJ1DlGF/4t8DACfWto6
++kYpqnBByGzm04+sLn6lQk=
=1arw
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
