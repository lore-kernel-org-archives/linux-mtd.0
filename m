Received: from mail-fx0-f223.google.com ([209.85.220.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NhtUb-0005CX-L0
	for linux-mtd@lists.infradead.org; Wed, 17 Feb 2010 23:39:46 +0000
Received: by fxm23 with SMTP id 23so11549024fxm.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Feb 2010 15:39:39 -0800 (PST)
Subject: Re: Legacy memstick support + FTL questions
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Alex Dubov <oakad@yahoo.com>
In-Reply-To: <849744.7095.qm@web37607.mail.mud.yahoo.com>
References: <849744.7095.qm@web37607.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 18 Feb 2010 01:39:37 +0200
Message-ID: <1266449977.4185.0.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-02-16 at 18:26 -0800, Alex Dubov wrote: 
> > I  mean when controller reads the 'int status' it does
> > send a TPC?
> > (I am sure that it does)
> > 
> > However mine can't do that and int status is read normally
> > (yay...)
> > 
> 
> There are two things to know:
> 1. In serial mode, some controllers issue GET_INT TPC automatically
> after each command, but only if certain configuration bit is set.
> 
> 2. In parallel mode, the meaningful bits of the interrupt register
> are exposed on the DIO pins of the media at the end of command execution
> and can be latched by the controller (this is a suggested behavior).
> 
> If you want to write a generic legacy MS support, you must take into
> account that this behavior is not there for granted.
> 

Thank you very very much.
This clears this issue for good.

Best regards,
Maxim Levitsky
