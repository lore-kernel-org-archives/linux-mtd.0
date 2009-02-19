Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1La2Bj-0004jq-Ed
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2009 06:15:14 +0000
Subject: Re: Bad Block Table support when using UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Torsten Fleischer <torsten.fleischer@kathrein.de>
In-Reply-To: <OF2FCA2B38.DF3448AE-ONC1257562.00219024-C1257562.0021AECD@kathrein.de>
References: <OF2FCA2B38.DF3448AE-ONC1257562.00219024-C1257562.0021AECD@kathrein.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 19 Feb 2009 08:14:50 +0200
Message-Id: <1235024090.17790.299.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-02-19 at 07:07 +0100, Torsten Fleischer wrote:
> This e-mail is confidential and may contain privileged information. If
> you have received this communication in error, please notify us
> immediately by responding to this email and then delete it from your
> system. The sender therefore does not accept liability for any errors
> or omissions in the contents of this message which arise as a result
> of e-mail transmission. We believe but do not warrant that this e-mail
> and any attachments are virus free. You must therefore take full
> responsibility for virus checking. 

According to your disclaimer I'm notifying you that some intruder from
your company sent this e-mail to a public mailing list, please fire him.
I'm deleting this e-mail from my mailbox as your disclaimer asks me to
do, but unfortunately it is archived and you would have to pay piles of
money to remove it from the mailing list archives.

Seriously, vs. bad block table: UBI does not have it's own block table,
and it asks this information from the driver. So probably it is ok for
the driver to store the BBT, although your flash is not big, so simple
scanning and building BBT in RAM would save you some flash space.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
