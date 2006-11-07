Received: from e35.co.us.ibm.com ([32.97.110.153])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GhPPY-0005Vd-7j
	for linux-mtd@lists.infradead.org; Tue, 07 Nov 2006 06:47:07 -0500
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e35.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id kA7BkRbF022247
	for <linux-mtd@lists.infradead.org>; Tue, 7 Nov 2006 06:46:27 -0500
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by westrelay02.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kA7BkRdh463716
	for <linux-mtd@lists.infradead.org>; Tue, 7 Nov 2006 04:46:27 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kA7BkQCA026001
	for <linux-mtd@lists.infradead.org>; Tue, 7 Nov 2006 04:46:26 -0700
Subject: Re: UBI and OneNAND
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1162899578.31636.19.camel@sauron>
References: <32544906.187201162866905328.JavaMail.weblogic@ep_ml06>
	<1162889433.5606.15.camel@localhost.localdomain>
	<loom.20061107T110704-786@post.gmane.org>
	<1162899578.31636.19.camel@sauron>
Content-Type: text/plain
Date: Tue, 07 Nov 2006 05:47:31 -0600
Message-Id: <1162900051.19697.16.camel@crusty.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: John Smith <john.smith@arrows.demon.co.uk>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-11-07 at 13:39 +0200, Artem Bityutskiy wrote:
> Hi, few notes:
> 
> On Tue, 2006-11-07 at 10:20 +0000, John Smith wrote:
> > UBI: data offset:                2048
> > UBI: max. allowed volumes:       128
> > UBI: wear-levelling threshold:   4096
> > UBI: number of internal volumes: 2
> > UBI: number of user volumes:     1
> > UBI: available PEBs:             49
> > UBI: total number of reserved PEBs: 126
> > UBI: number of PEBs reserved for bad PEB handling: 1
> Hmm, only one PEB is reserved, may be it makes sense to reserve more -
> there is a corresponding option.

It's the default.  I think it's too low of a default.  Others disagreed
with me.

Telling every new UBI user "may be it makes sense to reserve more" will
get old quick.  Perhaps the default should be bumped to 5 or so?

josh
