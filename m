Received: from py-out-1112.google.com ([64.233.166.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JOudY-0008E6-EZ
	for linux-mtd@lists.infradead.org; Tue, 12 Feb 2008 12:53:30 +0000
Received: by py-out-1112.google.com with SMTP id p76so8378309pyb.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Feb 2008 04:53:23 -0800 (PST)
Message-ID: <47B19690.10009@gmail.com>
Date: Tue, 12 Feb 2008 18:22:32 +0530
From: Max Stirling <vicky.irobot@gmail.com>
MIME-Version: 1.0
To: Christophe Lohr <Christophe.Lohr@enst-bretagne.fr>
Subject: Re: how to mount this mtd filesystem image?
References: <47B07A44.6030003@enst-bretagne.fr>
In-Reply-To: <47B07A44.6030003@enst-bretagne.fr>
Content-Type: multipart/mixed; boundary="------------050902080202010808030409"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------050902080202010808030409
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Christophe Lohr wrote:
> Hi,
> I’m not sure to be on the right mailing list…
>
> My problem is as follow: I have an mtd dump file. This is not a jffs2 
> file system image. It looks like a plain old flash file system, but 
> which one? How may I get the content of this file system?
>
> 00000000 46 66 73 23 00 03 01 00 c0 ff ff ff ff ff ff ff |Ffs#............|
> 00000010 2f 66 66 73 2d 72 6f 6f 74 00 ff ff ff ff ff ff |/ffs-root.......|
> 00000020 2e 6a 6f 75 72 6e 61 6c 00 ff ff ff c0 00 03 00 |.journal........|
> 00000030 02 00 00 00 c0 00 04 00 03 00 00 00 c0 00 05 00 |................|
> 00000040 04 00 00 00 c0 00 06 00 05 00 00 00 c0 00 07 00 |................|
> 00000050 06 00 00 00 c0 00 08 00 07 00 00 00 c0 00 09 00 |................|
> (...)
>
> Any help is welcome.
> Thanks and regards.
> Christophe
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>   
The first four bytes are the magic numbers telling which flash fs this 
might be.

00000000 46 66 73 23


#define CRAMFS_MAGIC    0x28cd3d45


I did a search for those numbers and couldn't find any reference to this 
anywhere. Try doing "file <your-mtd-dump-file> this might give more 
information

for eg:

->file test.cramfs.img
test.cramfs.img: Linux Compressed ROM File System data, little endian 
size 65536 version #2 sorted_dirs CRC 0xf23fc956, edition 0, 46 blocks, 
16 files.



--------------050902080202010808030409
Content-Type: text/x-vcard; charset=utf-8;
 name="vicky_irobot.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="vicky_irobot.vcf"

begin:vcard
fn:M S
n:S;M
version:2.1
end:vcard


--------------050902080202010808030409--
