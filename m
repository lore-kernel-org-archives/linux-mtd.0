Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17miT9-0002aY-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 23:17:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <541025071C7AC24C84E9F82296BB9B952D27@OPTEX1.optex.local> 
References: <541025071C7AC24C84E9F82296BB9B952D27@OPTEX1.optex.local> 
To: "John Hall" <john.hall@optionexist.co.uk>
Cc: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: compatmac.h 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 04 Sep 2002 23:17:50 +0100
Message-ID: <23590.1031177870@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

john.hall@optionexist.co.uk said:
>  I haven't submitted a proper patch, because I don't know how to check
> for specific rmk kernel versions. Any suggestions? 

#ifndef minor etc. I've just committed it.

--
dwmw2
