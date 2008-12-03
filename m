Received: from relay01.pair.com ([209.68.5.15])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L7upo-0005cw-HH
	for linux-mtd@lists.infradead.org; Wed, 03 Dec 2008 16:44:20 +0000
Date: Wed, 03 Dec 2008 08:44:05 -0800
Subject: Re: setting PAD parameter with JFFS2 and NAND -- what is correct
	thing to do ?
From: Grant Erickson <gerickson@nuovations.com>
To: Philip Rakity <prakity@yahoo.com>
Message-ID: <C55BF755.133A7%gerickson@nuovations.com>
In-Reply-To: <461019.6371.qm@web58901.mail.re1.yahoo.com>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/2/08 9:23 AM, Philip Rakity wrote:
> I am trying to understand what value to set the pad parameter to when making a
> JFFS2 image (including using sumtool) for NAND flash.
> 
> The NAND flash has 2KiB sectors, 256KiB erase size, and is 2GB.
> 
> I use flase_eraseall -j when erasing the flash and the flash HAS bad blocks.
> 
> The image size is less than the 2GB size of the flash.
> 
> I have tried both specifying pad (rounded up) to the erase block size and
> omitting pad.  When I write to the NAND there are recovered CRC errors from
> time to time as well as the other "errors" indicated in the FAQ.
> 
> If could set pad to the SIZE of the NAND flash, but because of bad blocks I am
> not sure this is correct...
> 
> Guidance Please.
> 
> Philip

Philip:

You should set the padding to the page size. For the two systems I have, the
mkfs.jffs2 commands used to build the root file systems are as follows:

    mkfs.jffs2 --big-endian \
    --no-cleanmarkers \
    --pad 512 \
    --pagesize 512 \
    --eraseblock 16384 \
    -d /tmp/fs/stripped/root \
    -D root.devtable \
    -o root.jffs2

and:

    mkfs.jffs2 --big-endian \
    --no-cleanmarkers \
    --pad 2048 \
    --pagesize 2048 \
    --eraseblock 131072 \
    -d /tmp/fs/stripped/root \
    -D root.devtable \
    -o root.jffs2

Regards,

Grant
