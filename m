Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R6Ms5-0005q6-3n
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 13:29:53 +0000
Received: by ywf9 with SMTP id 9so1319668ywf.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Sep 2011 06:29:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1316611702.4849.91.camel@sauron>
References: <CAFDOyVAi_++e_sBpeJyL5Dy2GwP+y=BV25dJ4_9GpCo532tdnA@mail.gmail.com>
	<1316611702.4849.91.camel@sauron>
Date: Wed, 21 Sep 2011 15:29:50 +0200
Message-ID: <CAFDOyVAuy1-yTYHjhfdX+czzVfib53O1gR_RSbvscHzM1daU+g@mail.gmail.com>
Subject: Re: mount options for jffs2
From: Folkert van Heusden <folkert.van.heusden@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> While hunting a database (SQLite) corruption issue (on jffs2) I
>> noticed that mount not only accepts barier=1 and data=journal but
>> test123 and test456 as well.
>> So I was wondering what mount options are supported for jffs2? I use
>> linux kernel version 2.6.19.
>
> I think jffs2 does not support any non-standard mount options - they are
> ignored.

Ok, thanks
