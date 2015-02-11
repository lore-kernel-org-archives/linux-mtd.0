Date: Wed, 11 Feb 2015 10:09:45 -0500 (EST)
From: Rodrigo Freire <rfreire@redhat.com>
To: Brian Norris <computersforpeace@gmail.com>
Message-ID: <1041042635.11106996.1423667385477.JavaMail.zimbra@redhat.com>
In-Reply-To: <1754439525.4551871.1417008736061.JavaMail.zimbra@redhat.com>
Subject: Re: [PATCH V2] mtd: block2mtd: Present block2mtd timely on boot time
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: Felix Fietkau <nbd@openwrt.org>,
 =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
 Herton Krzesinski <hkrzesin@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Brian Norris" <computersforpeace@gmail.com> 
Sent: Wednesday, November 26, 2014 1:33:04 AM 
Subject: Re: [PATCH V2] mtd: block2mtd: Present block2mtd timely on boot time 

> On Sun, Nov 09, 2014 at 07:18:05AM -0500, Rodrigo Freire wrote: 
> > > From: "Brian Norris" <computersforpeace@gmail.com> 
> > > Sent: Wednesday, November 5, 2014 6:23:03 PM 
> > 
> > > This still seems like a bad idea (using a block device + block2mtd + 
> > > JFFS2). Why are you doing this? See comments here: 
> > > http://www.linux-mtd.infradead.org/faq/jffs2.html#L_hdd_jffs2 
> > 
> > As Felix stated on a previous message to the thread, I am using JFFS2 over 
> > block2mtd where regular filesystems failed to do so well. There are several
> > [1] threads pointing this issue, and JFFS2 over block2mtd works like a 
> > charm 
> > on more harsh scenarios. 
> [...] 
> > [1] - http://bit.ly/1smGvwa 

> OK, so there are definitely problems with cheap SD card power cut 
> tolerance. That's not news. But that doesn't mean block2mtd + JFFS2 is a 
> good solution. In fact, when I add 'jffs2' to your Google search query 
> of 'raspberry pi corrupt sd card', the only mentions I see are those who 
> agree that this is not the right choice. 

> But anyway, we can look at supporting block2mtd (since you provided the 
> patches), even if we don't agree how it should be used. And in fact, I 
> might argue there are no good (production) uses for block2mtd, so I 
> suppose I don't have much stake in it :) 

Hi there Brian, 

This patchset primarily aims to fix a block2mtd behavior, and not introduce
new features (well, the device name and a timeout option are indeed new
options, but they're actually enhancements). block2mtd already exists, works
 nicely as boot root device on several architectures, but fails on BCM2835
arch. Our patchset only aims to get it fixed. We just want to block2mtd work
on BCM2835 the way it works on different architectures. So, this is a fix. 

As a side note, WRT the SD card corruption; it also happens on good quality
SD cards too. The main culprit for the corruption is bad mains / power supply
issues / abrupt poweroff. And there's also the wear leveling...

Thanks for the thorough review. 

Looking forward for the ACK ;-) 

My best regards, 

- RF. 
