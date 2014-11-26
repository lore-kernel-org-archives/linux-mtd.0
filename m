Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtTM9-0000DX-Fa
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 03:33:30 +0000
Received: by mail-pd0-f182.google.com with SMTP id r10so1869724pdi.41
 for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2014 19:33:07 -0800 (PST)
Date: Tue, 25 Nov 2014 19:33:04 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Rodrigo Freire <rfreire@redhat.com>
Subject: Re: [PATCH V2] mtd: block2mtd: Present block2mtd timely on boot time
Message-ID: <20141126033304.GR24364@ld-irv-0074>
References: <371358190.34795877.1410204429882.JavaMail.zimbra@redhat.com>
 <1444809468.34812041.1410206680931.JavaMail.zimbra@redhat.com>
 <20140909170231.GA14429@logfs.org>
 <1807144344.40128259.1410985683342.JavaMail.zimbra@redhat.com>
 <20141105202303.GN23619@ld-irv-0074>
 <9691395.7454649.1415535485079.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9691395.7454649.1415535485079.JavaMail.zimbra@redhat.com>
Cc: Felix Fietkau <nbd@openwrt.org>,
 =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
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

On Sun, Nov 09, 2014 at 07:18:05AM -0500, Rodrigo Freire wrote:
> > From: "Brian Norris" <computersforpeace@gmail.com>
> > Sent: Wednesday, November 5, 2014 6:23:03 PM
> 
> > This still seems like a bad idea (using a block device + block2mtd +
> > JFFS2). Why are you doing this? See comments here:
> > http://www.linux-mtd.infradead.org/faq/jffs2.html#L_hdd_jffs2
> 
> As Felix stated on a previous message to the thread, I am using JFFS2 over
> block2mtd where regular filesystems failed to do so well. There are several
> [1] threads pointing this issue, and JFFS2 over block2mtd works like a charm
> on more harsh scenarios.
[...]
> [1] - http://bit.ly/1smGvwa

OK, so there are definitely problems with cheap SD card power cut
tolerance. That's not news. But that doesn't mean block2mtd + JFFS2 is a
good solution. In fact, when I add 'jffs2' to your Google search query
of 'raspberry pi corrupt sd card', the only mentions I see are those who
agree that this is not the right choice.

But anyway, we can look at supporting block2mtd (since you provided the
patches), even if we don't agree how it should be used. And in fact, I
might argue there are no good (production) uses for block2mtd, so I
suppose I don't have much stake in it :)

Brian
