Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g0OD1-00066X-2B
 for linux-mtd@lists.infradead.org; Thu, 13 Sep 2018 09:46:49 +0000
Date: Thu, 13 Sep 2018 11:46:30 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: ubifs: regression since "ubifs: xattr: Don't operate on deleted
 inodes"
Message-ID: <20180913094630.GB634@kroah.com>
References: <fd473abd-58d2-076f-675a-fb1ac06aa984@ncentric.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd473abd-58d2-076f-675a-fb1ac06aa984@ncentric.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

adding stable@ for stable kernel issues...

On Thu, Sep 13, 2018 at 09:58:35AM +0200, Koen Vandeputte wrote:
> Hi all,
> 
> I'm currently in the process of updating the kernel version within OpenWrt.
> (4.14.68 to 4.14.69)
> 
> Testing shows some issues on devices using specifically UBIFS.
> Altering a perfect valid writable file shows weird errors:
> 
> 
> [ Node 2 | node-2 ] ls -l /root/custom/scripts/banner.sh
> -rwxr-xr-x    1 root     root           283 Sep 11 09:52
> /root/custom/scripts/banner.sh
> 
> [ Node 2 | node-2 ] cat /root/custom/scripts/banner.sh
> #!/bin/sh
> 
> if [ ! -f /root/.banner_ok ]
> then
>     RELEASE=$(cat /root/build_date)
>     VERSION=$(cat /root/version)
> 
>     echo "Generating banner: $VERSION $RELEASE"
>     sed s/VERSION/$VERSION/g /root/custom/banner > /etc/banner
>     sed -i s/RELEASE/$RELEASE/g /etc/banner
> 
>     touch /root/.banner_ok
> fi
> 
> [ Node 2 | node-2 ] echo "test" > /root/custom/scripts/banner.sh
> -ash: can't create /root/custom/scripts/banner.sh: nonexistent directory
> 
> 
> 
> I'm also noticing other apps fail because /etc doesn't exists yet after
> UBIFS boot loading.
> these 2 issues were not seen on 4.14.68.
> 
> The bootlog doesn't show any error:
> https://pastebin.com/raw/dJx47uBp
> 
> 
> I'm only seeing these issues on UBIFS enabled volumes.
> Reverting ("ubifs: xattr: Don't operate on deleted inodes") fixes these
> weird issues.

Do you also have the same problem on Linus's latest tree, or 4.18, with
this change in the tree?

thanks,

greg k-h
