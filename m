Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rkk53-00029o-Tz
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 22:22:10 +0000
Received: by eekc4 with SMTP id c4so33599eek.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2012 14:22:08 -0800 (PST)
Subject: Re: [PATCH] cfi: AMD/Fujitsu compatibles: add panic write support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Florian Fainelli <ffainelli@freebox.fr>
Date: Wed, 11 Jan 2012 00:22:06 +0200
In-Reply-To: <4F0CB86C.10006@freebox.fr>
References: <1325878159-32306-1-git-send-email-iws@ovro.caltech.edu>
 <4F0C124F.7040807@freebox.fr> <1326233055.2335.13.camel@koala>
 <4F0CB86C.10006@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1326234127.2335.19.camel@koala>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 "Ira W. Snyder" <iws@ovro.caltech.edu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2012-01-10 at 23:15 +0100, Florian Fainelli wrote:
> 
> My concern is about not adding more code which is barely used. I
> don't 
> question the mtdoops driver, it definitively is useful. 

I'd actually question "substential" - a tiny piece in generic parts
and few functions in drivers does not look substantial.

Artem.
