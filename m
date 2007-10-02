Received: from mtagate6.uk.ibm.com ([195.212.29.139])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IcgF2-0000IG-J5
	for linux-mtd@lists.infradead.org; Tue, 02 Oct 2007 12:48:48 +0100
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate6.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l92BlV38461400
	for <linux-mtd@lists.infradead.org>; Tue, 2 Oct 2007 11:47:31 GMT
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.5) with
	ESMTP id l92BlVg32994250
	for <linux-mtd@lists.infradead.org>; Tue, 2 Oct 2007 12:47:31 +0100
Received: from d06av03.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l92BlEMl019078
	for <linux-mtd@lists.infradead.org>; Tue, 2 Oct 2007 12:47:15 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: dedekind@infradead.org
Subject: Re: [PATCH 2/4 try2] ubi-utils: migrate ubimirror
Date: Tue, 2 Oct 2007 13:40:05 +0200
References: <200709271952.06870.alexs@linux.vnet.ibm.com>
	<200709280941.38303.alexs@linux.vnet.ibm.com>
	<1191056139.7774.12.camel@sauron>
In-Reply-To: <1191056139.7774.12.camel@sauron>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200710021340.06106.alexs@linux.vnet.ibm.com>
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: haver@vnet.ibm.com, linux-mtd@lists.infradead.org,
	Andreas Arnez <arnez@linux.vnet.ibm.com>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Saturday 29 September 2007 10:55:39 Artem Bityutskiy wrote:
> The series looks good to me.
>
> The infradead.org has a rule so that if one mail A refers mail B (via
> In-reply-to or Reference:), then mail A has to have Re: prefix in the
> subject. Otherwise, the mail is trapped and waits for moderation.
>
> At the moment one of the infradead.org servers is dead and I cannot
> approve your series which looks perfectly fine.
>
> So what you can do is to just add Re: to the subject of all the mails
> but the first one (0/4). Yes, it is weird but such is life at
> infradead.org.
>
> Or just wait when the server is up again and the postings are moderated.

thank you for the review!

I'll integrate Frank's suggestions and resend the series with proper subjects.

Regards,
Alex
