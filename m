Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLBuM-0001YM-2F
 for linux-mtd@lists.infradead.org; Wed, 05 Mar 2014 13:30:50 +0000
Date: Wed, 5 Mar 2014 10:30:02 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: block: Use ENOSYS as return value when
 CONFIG_UBIBLOCK=n
Message-ID: <20140305133002.GA1284@arch.cereza>
References: <1393930663-8737-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1393933791.3412.208.camel@sauron.fi.intel.com>
 <20140304121446.GA8826@localhost>
 <1393938044.6302.2.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1393938044.6302.2.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 04, Artem Bityutskiy wrote:
> On Tue, 2014-03-04 at 09:14 -0300, Ezequiel Garcia wrote:
> > On Tue, Mar 04, 2014 at 01:49:51PM +0200, Artem Bityutskiy wrote:
> > > On Tue, 2014-03-04 at 07:57 -0300, Ezequiel Garcia wrote:
> > > > In order to have a way of distinguishing an invalid ioctl from a
> > > > not supported (but otherwise valid) ioctl, this commit changes the
> > > > return value of the ioctl stubs from ENOTTY to ENOSYS.
> > > 
> > > Sounds logical, no objections, except it is curious if this is something
> > > you invented or this is a general rule in the Linux kernel? If it is,
> > > may be you can point to some discussions, or give some example or other
> > > source of this knowledge? I just want to be educated a bit. Thanks!
> > > 
> > 
> > Yes, I think it's a pretty extended kernel practice to return -ENOSYS when
> > a function is not built or either not implemented.
> 
> Pushed this one and the previous 3 ones. I think what is left is ioctl
> names and the user-space tool.
> 

I'm seeing all the other patches pushed, but not this one. Do you want me to
send a rebased patch?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
