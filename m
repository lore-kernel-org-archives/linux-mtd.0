Received: from fg-out-1718.google.com ([72.14.220.155])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NehiA-0002uV-2j
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 04:28:35 +0000
Received: by fg-out-1718.google.com with SMTP id e12so1198fga.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Feb 2010 20:28:26 -0800 (PST)
Subject: Re: ubi, ubifs, and preempt
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <dbdb2ea61002081707w416a84b1mccb3bec2da408e99@mail.gmail.com>
References: <dbdb2ea61002081707w416a84b1mccb3bec2da408e99@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Feb 2010 06:20:31 +0200
Message-Id: <1265689231.25419.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-02-08 at 20:07 -0500, twebb wrote:
> Maybe this is a dump question, but can UBI and UBIFS be used in a
> kernel which has CONFIG_PREEMPT=y ?

Yes, of course.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
