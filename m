Received: from mo-p05-ob6.rzone.de ([2a01:238:20a:202:53f5::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S0qKr-0005pr-QV
 for linux-mtd@lists.infradead.org; Fri, 24 Feb 2012 08:17:02 +0000
Message-ID: <4F474777.4080408@esd.eu>
Date: Fri, 24 Feb 2012 09:16:55 +0100
From: Matthias Fuchs <matthias.fuchs@esd.eu>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Updating UBIFS rootfilesystem
References: <4F326E27.7020407@esd.eu>
 <1329141475.22240.151.camel@sauron.fi.intel.com>
In-Reply-To: <1329141475.22240.151.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/13/2012 02:57 PM, Artem Bityutskiy wrote:
> On Wed, 2012-02-08 at 13:44 +0100, Matthias Fuchs wrote:
>> Hi,
>>
>> is there an elegant way to update an UBIFS rootfilesystem?
>>
>> Let's say I have enough flash space for my actual rootfilesystem
>> (rootfs1) and a new version (rootfs2). So while running from rootfs1
>> I updated rootfs2 volume with a new rootfilesystem.
> 
> I you cannot update a mounted fs - you have to unmount it first. If you
> are able to do this, you should be able to ubirename.
So I was thinking that a ubirename is not really an update and expected the rename
op to work even on a mounted fs.

I solved the issue by booting an initramfs first. 
There I do the rename "rootfs2" -> "rootfs1" and then switch root 
to "rootfs1". 

Matthias
