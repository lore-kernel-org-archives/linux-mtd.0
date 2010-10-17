Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7QJh-0006RV-JL
	for linux-mtd@lists.infradead.org; Sun, 17 Oct 2010 10:18:14 +0000
Received: by fxm15 with SMTP id 15so1552312fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Oct 2010 03:18:12 -0700 (PDT)
Subject: Re: [MTD] My updates [RESEND]
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <1287156047-17439-1-git-send-email-maximlevitsky@gmail.com>
References: <1287156047-17439-1-git-send-email-maximlevitsky@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 17 Oct 2010 13:15:09 +0300
Message-ID: <1287310509.1951.13.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	Kevin Cernekee <cernekee@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	Maciej Rutecki <maciej.rutecki@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-10-15 at 17:20 +0200, Maxim Levitsky wrote:
> Here are few patches for 2.6.37 that I have in my patch queue for MTD.
> 
> Best regards,
> 	Maxim Levitsky

I've just tested this and it fixes the issue Kevin Kernekee reported
here:
http://lists.infradead.org/pipermail/linux-mtd/2010-September/031925.html

CCing him as it is nice to inform reporters about fixes.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
