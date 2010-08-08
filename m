Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oi6PO-00031T-IQ
	for linux-mtd@lists.infradead.org; Sun, 08 Aug 2010 13:59:27 +0000
Received: by fxm3 with SMTP id 3so5856556fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 08 Aug 2010 06:59:25 -0700 (PDT)
Subject: Re: [PATCHv2 7/9] UBIFS: do not write rubbish into truncation
	scanning node
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <4C5E901E.5060802@nokia.com>
References: <1281261452-9868-1-git-send-email-dedekind1@gmail.com>
	<1281261452-9868-8-git-send-email-dedekind1@gmail.com>
	<4C5E8F15.9080505@nokia.com>  <4C5E901E.5060802@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 08 Aug 2010 16:59:21 +0300
Message-Id: <1281275962.1175.84.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-08-08 at 14:08 +0300, Adrian Hunter wrote:
> No I was wrong, the key in ubifs_recover_size_accum() is already created using
> trun_key_init()
> 
> Still, trun_key_init might be better here because the all-zeroes key has a key-type
> of UBIFS_INO_KEY.  What do you think?

Did not really think, but off the top of my head it is probably good to
initialize ->key to something invalid of all other nodes then.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
