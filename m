Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1q2B-0007xA-DI
 for linux-mtd@lists.infradead.org; Mon, 17 Sep 2018 09:41:37 +0000
From: Richard Weinberger <richard@nod.at>
To: Greg KH <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org
Cc: Koen Vandeputte <koen.vandeputte@ncentric.com>,
 stable <stable@vger.kernel.org>
Subject: Re: ubifs: regression since "ubifs: xattr: Don't operate on deleted
 inodes"
Date: Mon, 17 Sep 2018 11:41:21 +0200
Message-ID: <1797702.BeYT81U7IA@blindfold>
In-Reply-To: <20180917093804.GD26181@kroah.com>
References: <fd473abd-58d2-076f-675a-fb1ac06aa984@ncentric.com>
 <957f48b5-cc45-ce9b-0a48-cab8534ad570@ncentric.com>
 <20180917093804.GD26181@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Montag, 17. September 2018, 11:38:04 CEST schrieb Greg KH:
> On Sun, Sep 16, 2018 at 09:52:48PM +0200, Koen Vandeputte wrote:
> > 
> > 
> > On 15-09-18 09:15, Richard Weinberger wrote:
> > > Koen,
> > > 
> > > On Thu, Sep 13, 2018 at 12:09 PM gregkh@linuxfoundation.org
> > > <gregkh@linuxfoundation.org> wrote:
> > > > adding stable@ for stable kernel issues...
> > > > 
> > > > On Thu, Sep 13, 2018 at 09:58:35AM +0200, Koen Vandeputte wrote:
> > > > > Hi all,
> > > > > 
> > > > > I'm currently in the process of updating the kernel version within OpenWrt.
> > > > > (4.14.68 to 4.14.69)
> > > > > 
> > > > > Testing shows some issues on devices using specifically UBIFS.
> > > > > Altering a perfect valid writable file shows weird errors:
> > > > > 
> > > > > 
> > > > > [ Node 2 | node-2 ] ls -l /root/custom/scripts/banner.sh
> > > > > -rwxr-xr-x    1 root     root           283 Sep 11 09:52
> > > > > /root/custom/scripts/banner.sh
> > > > > 
> > > > > [ Node 2 | node-2 ] cat /root/custom/scripts/banner.sh
> > > > > #!/bin/sh
> > > > > 
> > > > > if [ ! -f /root/.banner_ok ]
> > > > > then
> > > > >      RELEASE=$(cat /root/build_date)
> > > > >      VERSION=$(cat /root/version)
> > > > > 
> > > > >      echo "Generating banner: $VERSION $RELEASE"
> > > > >      sed s/VERSION/$VERSION/g /root/custom/banner > /etc/banner
> > > > >      sed -i s/RELEASE/$RELEASE/g /etc/banner
> > > > > 
> > > > >      touch /root/.banner_ok
> > > > > fi
> > > > > 
> > > > > [ Node 2 | node-2 ] echo "test" > /root/custom/scripts/banner.sh
> > > > > -ash: can't create /root/custom/scripts/banner.sh: nonexistent directory
> > > > > 
> > > > > 
> > > > > 
> > > > > I'm also noticing other apps fail because /etc doesn't exists yet after
> > > > > UBIFS boot loading.
> > > > > these 2 issues were not seen on 4.14.68.
> > > > > 
> > > > > The bootlog doesn't show any error:
> > > > > https://pastebin.com/raw/dJx47uBp
> > > > > 
> > > > > 
> > > > > I'm only seeing these issues on UBIFS enabled volumes.
> > > > > Reverting ("ubifs: xattr: Don't operate on deleted inodes") fixes these
> > > > > weird issues.
> > > Please see my answer to the other thread.
> > > Always keep the patch author on CC and don't start multiple threads for the
> > > same issue on two mailing lists.
> > > Yes, I didn't answer for three days, I had no internet connection...
> > > 
> > Richard,
> > 
> > I indeed posted here too as we passed the 3 days marker, and I noticed
> > 4.14.70 RC2 got staged.
> > Also, a lot of developers tend to ignore questions unless the initial
> > question got posted to the official mailinglist.
> > 
> > Let's continue on the OpenWrt list as you propose, were the initial question
> > was raised.
> > 
> > Apologies for the (double) noise.
> 
> I will assume that if the resolution is that something needs to be done
> to the stable releases and a patch added/reverted, someone will
> eventually tell me?

The revert was sent yesterday to the mailinglist.
I'll send Linus^Wyou a pull request soon and from here
it can go into stable.

Thanks,
//richard
