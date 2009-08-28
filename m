Received: from mail-ew0-f208.google.com ([209.85.219.208])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MgwPq-00068i-Va
	for linux-mtd@lists.infradead.org; Fri, 28 Aug 2009 08:02:39 +0000
Received: by ewy4 with SMTP id 4so1876099ewy.27
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Aug 2009 01:02:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <eedb5540908270403q13678066k49199ed43688fee3@mail.gmail.com>
References: <eedb5540908270403q13678066k49199ed43688fee3@mail.gmail.com>
Date: Fri, 28 Aug 2009 10:02:33 +0200
Message-ID: <eedb5540908280102h5b00f54dja5c280dcbb2de55d@mail.gmail.com>
Subject: Re: Problems with jffs2 partition after reboot
From: javier Martin <javier.martin@vista-silicon.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/8/27 javier Martin <javier.martin@vista-silicon.com>:
> Hello, I am using kernel 2.6.30 and have a jffs2 partition in
> /dev/mtdblock3. It is used for storing small configuration files.
> My board is a Visstrim_m10 based in i.MX27 processor and I am using a
> 32MB NOR flash (S29WS256P) from Spansion.
>
> I have created my jffs2 partition with the following command:
> sudo mkfs.jffs2 -r $TARGET_FS/mnt/jffs2 -s 0x800 -e 0x20000 -o
> $PATH_TO_RELEASES/$ReleaseName/config.jffs2 -v --pad=0x280000
>
> Then I use RedBoot to store the jffs2 image in flash.
>
> When I boot my board the first time I can mount my jffs2 partition and
> access its files without problems:
> mount -t jffs2 /dev/mtdblock3 /mnt/jffs2
>
> Then I try to write a file through SSH in /root/.ssh/ which is a
> symlink to my jffs2 partition (/mnt/jffs2/root/.ssh/):
> cat /remotehome/javier/.ssh/id_rsa.pub | ssh root@192.168.0.141 'cat
>>> .ssh/authorized_keys'
>
> Operation succeeded and I type reboot. But when my board is up again I
> mount my jffs2 partition again and these messages appear:
> jffs2_scan_eraseblock(): Node at 0x000006b8 {0x1985, 0xe002,
> 0x0000019f) has invalid CRC 0x68602fb2 (calculated 0x6860afb2)
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006bc:
> 0x019f instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006c0:
> 0x2fb2 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006c4:
> 0x000a instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006c8:
> 0x0002 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006cc:
> 0x81a4 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006d4:
> 0x018c instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006d8:
> 0x0098 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006dc:
> 0x0098 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006e0:
> 0x0098 instead
> Further such events for this erase block will not be printed
>
> And the file I wrote has disappeared inside the jffs2 partition.
>
> Please, can you give me a tip of what can be happening here? Maybe I
> made a mistake in the previously described process.
>
> Thank you.
> --
> Javier Martin
> Vista Silicon S.L.
> Universidad de Cantabria
> CDTUC - FASE C - Oficina S-345
> Avda de los Castros s/n
> 39005- Santander. Cantabria. Spain
> +34 942 25 32 60
> www.vista-silicon.com
>

I am still having problems with this issue. I have enabled the option
"Verify buffer writes in jffs2" but it does not through an error. It
is strange, there is actually a write error but it is not detected by
jffs2_verify_write(). Why? Is this NOR flash model (S29WS256P) not
supporting this feature?

Thanks.

-- 
Javier Martin
Vista Silicon S.L.
CDTUC - FASE C - Oficina S-345
Avda de los Castros s/n
39005- Santander. Cantabria. Spain
+34 942 25 32 60
www.vista-silicon.com
