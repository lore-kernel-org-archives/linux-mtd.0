Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZelX-0002TZ-AS
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 07:55:56 +0000
Received: by pzk1 with SMTP id 1so1468598pzk.16
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 00:55:47 -0700 (PDT)
Subject: Re: [PATCH V2 00/18] mtd: cleanup partition handling in OF-enabled
	drivers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Thu, 23 Jun 2011 10:56:32 +0300
In-Reply-To: <1308735472-32640-1-git-send-email-dbaryshkov@gmail.com>
References: <1308735472-32640-1-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308815796.18119.93.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-22 at 13:37 +0400, Dmitry Eremin-Solenikov wrote:
> Changes since V1:
>  * Tab-vs-space cleanup
>  * 80-column cleanup
>  * documented of_node parser data field
>  * changed documentation for parser_data arguments

Pushed to l2-mtd-2.6.git, thanks for good cleanups.

-- 
Best Regards,
Artem Bityutskiy
