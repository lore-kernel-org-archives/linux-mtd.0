Received: from onz.com ([67.121.61.113] helo=dual166.onz.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Up55-0008F4-3a
	for <linux-mtd@lists.infradead.org>; Tue, 24 Jun 2003 15:47:35 +0100
Message-Id: <5.2.1.1.0.20030624073531.00ae4780@192.168.1.10>
Date: Tue, 24 Jun 2003 07:37:21 -0700
To: "Mikael Starvik" <mikael.starvik@axis.com>,
 "'David Woodhouse'" <dwmw2@infradead.org>,
 "'Alexander Viro'" <aviro@redhat.com>
From: Allen Curtis <acurtis@onz.com>
In-Reply-To: <3C6BEE8B5E1BAC42905A93F13004E8AB03277992@mailse01.axis.se>
References: <3C6BEE8B5E1BAC42905A93F13004E8AB032ABD2B@mailse01.axis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
cc: 'Infradead Org' <linux-mtd@lists.infradead.org>
cc: jffs-dev@axis.com
Subject: RE: JFFS patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I would be screaming a lot if we were not moving to JFFS2 ourselves. 
However this will take us a few months to accomplish. If there is any 
interest in JFFS and if someone is kind enough to point out the work TBD, I 
will take a shot.

At 12:48 PM 6/24/03 +0200, Mikael Starvik wrote:
>Even at Axis (the original copyright holder of JFFS1) we are now using
>JFFS2. I'll check if someone inhouse is interrested in keeping JFFS1
>maintained 2.6.
>
>PS. I tested JFFS1 in 2.5 a while ago and it seamed to kind of work after
>one small patch. But I guess that there is much more to be done to make
>it reliable. DS
>
>/Mikael
>
>-----Original Message-----
>From: owner-jffs-dev@axis.com [mailto:owner-jffs-dev@axis.com] On Behalf Of
>David Woodhouse
>Sent: Tuesday, June 24, 2003 12:42 PM
>To: Alexander Viro
>Cc: Allen Curtis; Infradead Org; jffs-dev@axis.com
>Subject: Re: JFFS patch
>
>
>On Tue, 2003-06-24 at 11:35, Alexander Viro wrote:
> > It would be nice.  There are several ugly craps in there and I'd
> > rather see it gone than try and fix them...
>
>Me too -- I started cleaning up at one point and the result was JFFS2 :)
>
>So unless I hear anguished screams from a huge user base who are using it
>and not JFFS2 for reasons which they haven't yet reported as JFFS2 bugs, and
>someone also steps forward to clean it up for 2.6, I'll submit a patch to
>Linus to remove it in a couple of weeks time.
>
>--
>dwmw2
>
>
>To unsubscribe from this list: send the line "unsubscribe jffs-dev" in the
>body of a message to majordomo@axis.com
