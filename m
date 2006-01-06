Received: from zproxy.gmail.com ([64.233.162.195])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Euu2Z-0001nO-LI
	for linux-mtd@lists.infradead.org; Fri, 06 Jan 2006 11:02:32 -0500
Received: by zproxy.gmail.com with SMTP id i11so2944437nzi
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 Jan 2006 08:02:06 -0800 (PST)
Message-ID: <625fc13d0601060802n2710bc26wf57b8c0578cc1c7f@mail.gmail.com>
Date: Fri, 6 Jan 2006 10:02:06 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Pramod P K <pra.engr@gmail.com>
In-Reply-To: <417f1b740601052237w84b78dbqf2cb44d4f8ffdeee@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <417f1b740601052237w84b78dbqf2cb44d4f8ffdeee@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: "Bad eraseblock" and "Failed ECC read"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/6/06, Pramod P K <pra.engr@gmail.com> wrote:
> This is the MTD NAND with JFFS2 and after I flash I get:
>
>
> My U-Boot v0.1
>
> .......
>
>
> NAND device: Manufacturer ID: 0xec, Chip ID: 0xa1 (Samsung NAND 128MiB
> 1,8V 8-bit)
> Scanning device for bad blocks
> ....
> ....
>
> check_short_pattern: p[td->offs + i]: ff td->pattern[i]: ff
>
> ...
>
> check_short_pattern: p[td->offs + i]: 84 td->pattern[i]: ff
> Bad eraseblock 96 at 0x00c00000
>
> td->len:2
> check_short_pattern: p[td->offs + i]: 23 td->pattern[i]: ff
> Bad eraseblock 97 at 0x00c20000
>
> .....
>
> NAND flash probing at 0x20020000 Finished
> In:    console
> Out:   console
> Err:   console
> Hit any key to stop autoboot:  2 =08=08=08 1 =08=08=08 0
>
> Loading from device 0: NAND 128MiB 1,8V 8-bit at 0x200b8000 (offset 0xd00=
000)
>
> .....
>
> : do_nandboot(): ecc_status=3D-1
> nand_read_ecc: Failed ECC read, page 0x00001a00
>
> .....
>
> : do_nandboot(): ecc_status=3D-1
> nand_read_ecc: Failed ECC read, page 0x00001a00
>
> ...
>
> ** Read error on 0
> Boot reached stage -1
>
>
>
> Please come with the possibilities.

1) This shows u-boot failing, not MTD/JFFS2.  This has been sent to
the wrong list.

2) The amount of information is so small that nobody would even know
where to begin to look if it were a MTD/JFFS2 problem.  You don't say
what version of the kernel, what version of MTD, what board you are
even using.

I seriously doubt anybody will even think of coming up with
possiblities for you unless you give way more detailed information
that is relevant to MTD/JFFS2.

josh
