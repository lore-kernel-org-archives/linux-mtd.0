Received: from smtpout04-01.prod.mesa1.secureserver.net ([64.202.165.196])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IJb6G-0005EM-Md
	for linux-mtd@lists.infradead.org; Fri, 10 Aug 2007 16:28:52 -0400
Message-ID: <46BCCAB0.8010807@techmoninc.com>
Date: Fri, 10 Aug 2007 15:29:36 -0500
From: Andy Kennedy <akennedy@techmoninc.com>
MIME-Version: 1.0
To: Donald Green <dgreen@mekinesis.com>,  linux-mtd@lists.infradead.org
Subject: Re: [Fwd: M-Sys drivers] ; Re: DiskOnChip 2000 (DOC 2000) woes.
References: <46BA20BB.1040607@techmoninc.com>	<87F8ED761B96574FA3397B6ADBC372AC064310B0@MI8NYCMAIL01.Mi8.com>	<46BB764D.1000008@techmoninc.com>	<87F8ED761B96574FA3397B6ADBC372AC064310E8@MI8NYCMAIL01.Mi8.com>	<46BB79BC.5070708@techmoninc.com>	<87F8ED761B96574FA3397B6ADBC372AC06431118@MI8NYCMAIL01.Mi8.com>	<46BB80C8.1060803@techmoninc.com>	<87F8ED761B96574FA3397B6ADBC372AC0643112D@MI8NYCMAIL01.Mi8.com>	<46BC78BB.7020605@techmoninc.com>	<87F8ED761B96574FA3397B6ADBC372AC06431282@MI8NYCMAIL01.Mi8.com>	<46BC7CB7.7080002@techmoninc.com>	<87F8ED761B96574FA3397B6ADBC372AC064312AB@MI8NYCMAIL01.Mi8.com>
	<46BCBB6F.7050406@techmoninc.com>
In-Reply-To: <46BCBB6F.7050406@techmoninc.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andy Kennedy wrote:
> Good theory.  The thing that gets me is that I see this same error when
> I fdisk a device like /dev/sda1 in place of /dev/sda.  Is it possible
> that the nftl driver is handing out the wrong partition information?  Is
> there a way that I can know for sure that the device was formatted
> correctly by the nftl driver?
>
> I'm having this same problem with the MD-2800-D08 and MD-2202-D32-X.
>
> If you development folks have any suggestions I'm game.  Please
> enlighten me!
>
> Donald Green wrote:
>   
[quote=http://www.ibiblio.org/pub/Linux/docs/HOWTO/Disk-on-Chip-HOWTO]

 2. The TrueFFS Linux driver package contains three different folders:
   
      + Documentation: this contains a PDF document describing the various
        functions of TrueFFS.
       
      + dformat_5_1_4_37: this contains a utility dformat, which is used to
        update the firmware on the DiskOnChip (DOC) and to create low level
        partitions on the DOC.
       
      + doc-linux-5_1_4_20: this contains patches, initrd scripts and other
        utilities.
       
   
 3. Now apply the patch to the kernel. We will use the linux-2_4_7-patch file
    that is present in linux_binary.5_1_4/doc-linux-5_1_4_20/driver. The
    following commands are used for this purpose:
   
    cd linux_binary.5_1_4/doc-linux-5_1_4_20/driver
   
    patch -p1 -d /usr/src/linux < linux-2_4_7-patch
   
    This will create a directory named doc in the linux/drivers/block
    directory.

[/quote]

Okay, so do I have to install the 5.1.4 DOC driver to make the DOC2000 work with 2.6.22.1???  Should I back up to 2.4.18 like the howto says?

Andy
