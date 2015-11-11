Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwddr-0003Na-Ox
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2015 22:13:24 +0000
Received: by pabfh17 with SMTP id fh17so42839109pab.0
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 14:13:03 -0800 (PST)
Received: from google.com ([2620:0:1000:1301:b5e8:66ef:5e80:54ae])
 by smtp.gmail.com with ESMTPSA id jp1sm8952465pbc.54.2015.11.11.14.13.02
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
 Wed, 11 Nov 2015 14:13:02 -0800 (PST)
Date: Wed, 11 Nov 2015 14:13:00 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH mtd-utils 00/11] flash_{un,}lock upgrades
Message-ID: <20151111221300.GB71848@google.com>
References: <1441060472-82169-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441060472-82169-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 31, 2015 at 03:34:21PM -0700, Brian Norris wrote:
> Hi,
> 
> I've done a bit of work to make the flash_lock tool more useful, in order to
> help test some new SPI NOR block protection features. Of note:
> 
>  * added getopt support
>  * further unified flash_unlock and flash_lock -- the only difference now is
>    their default feature, and both binaries contain support for all features
>  * add support for MEMISLOCKED, so we can query arbitrary regions for
>    protection status
>  * mtdinfo -M already can dump some block lock information, but you get a
>    little more flexibility using flash_lock --info, so both seem worth having
>    IMO
> 
> Unsolved issues:
> 
>  * the MEM{LOCK,UNLOCK,ISLOCKED} ioctls all still use the out-dated 32-bit
>    erase_info_user struct, which means they'll have problems supporting >=4GB
>    flash. This isn't a mtd-utils problem, per se, and at the moment, Linux NAND
>    (the only (?) candidate for >=4GB flash) support doesn't implement any of
>    the locking APIs. But just an observation I ran across.
>  * Deprecation plan: it would make sense to deprecate and remove flash_unlock
>    eventually (in favor of 'flash_lock --unlock'), but this isn't really
>    pressing, so I don't see a good reason to spend much effort on it.
> 
> Enjoy,
> Brian

Pushed to mtd-utils.git
