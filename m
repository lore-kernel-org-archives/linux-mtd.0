Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R8AlL-00007G-Mo
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2011 12:58:25 +0000
Message-ID: <4E807713.5060401@free-electrons.com>
Date: Mon, 26 Sep 2011 14:58:59 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCHv6] UBI: new module ubiblk: block layer on top of UBI
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>	
	<1316678312-8913-1-git-send-email-david.wagner@free-electrons.com>
	<1316775538.19921.19.camel@sauron>
In-Reply-To: <1316775538.19921.19.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-embedded <linux-embedded@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, lkml <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 09/23/2011 12:58 PM, Artem Bityutskiy wrote:
[...]
> 2. Please, could you explain what prevents the following crash/issue:
> 
> modprobe ubiblk volumes=0:0
> mkfs.ext3 /dev/ubiblk0
> mount -t ext3 /dev/ubiblk0 /mnt/fs
> rmmod ubiblk
> 
> Not that I think this is a problem, I just do not realize what would
> prevent ubiblk from being unloaded when it is mounted. Did you test this
> scenario?

I forgot to address this in the v7, so:

The kernel has an internal refcounter for each module.  It increases
with each module that uses it and for each open device owned by it.

In the case of ubiblk, we have:
static const struct block_device_operations ubiblk_ops = {
        .owner = THIS_MODULE,
        .open = ubiblk_open,
        .release = ubiblk_release,
};

The "owner" field makes ubiblk devices owned by ubiblk, so each open
device increases the refcounting and if the user tries to rmmod ubiblk
when there are still open ubiblk devices, it will get an EBUSY error.


	Regards,
	David.

-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
