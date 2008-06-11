Received: from wa-out-1112.google.com ([209.85.146.180])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K6LC0-0003Ja-87
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 07:56:28 +0000
Received: by wa-out-1112.google.com with SMTP id v33so2068401wah.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2008 00:56:27 -0700 (PDT)
Message-ID: <ac8af0be0806110056q427ff589h1269d4d8633d0170@mail.gmail.com>
Date: Wed, 11 Jun 2008 15:56:26 +0800
From: "Zhao Forrest" <forrest.zhao@gmail.com>
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: A question about UBIFS
In-Reply-To: <484F7202.1010701@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <ac8af0be0806102116l5918c48ax279d456b4de1d061@mail.gmail.com>
	<484F7202.1010701@nokia.com>
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
>> My question is how page 11 is updated by UBIFS/UBI?
>
> As far as UBIFS goes, you need to learn about wandering trees and
> garbage collection.

This question is just out of my curiosity and not related to this topic.
Do you know if there is any FTL implemented by firmware doing the
out-of-place updating? Maybe this is too complexed to be implemented
by firmware?

Thanks,
Forrest
