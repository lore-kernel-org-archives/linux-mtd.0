Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R6JIE-0006Tp-OU
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 09:40:39 +0000
Received: by yxi11 with SMTP id 11so1156556yxi.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Sep 2011 02:40:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201109211126.09072.ffainelli@freebox.fr>
References: <CAFDOyVAi_++e_sBpeJyL5Dy2GwP+y=BV25dJ4_9GpCo532tdnA@mail.gmail.com>
	<201109211126.09072.ffainelli@freebox.fr>
Date: Wed, 21 Sep 2011 11:40:36 +0200
Message-ID: <CAFDOyVAjcnNQ==b53NYk2NSV0Ku47Tx5epan8j94QgccG_i6pg@mail.gmail.com>
Subject: Re: mount options for jffs2
From: Folkert van Heusden <folkert.van.heusden@gmail.com>
To: Florian Fainelli <ffainelli@freebox.fr>
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
>
> This could rather be a bug in busybox (assuming you use it), which does not
> verify the various mount options provided. For instance, one also do the
> following: mount -o remount,rz / without getting an error from busybox's
> mount.

Ah ok.
And do you know which options are supported?
