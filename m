Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13XIgP-0007a3-00
	for mtd-list@infradead.org; Fri, 08 Sep 2000 08:34:45 +0100
Received: from runyon.cygnus.com ([205.180.230.5] helo=cygnus.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13XIgN-0007Zx-00
	for mtd@infradead.org; Fri, 08 Sep 2000 08:34:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39B7E0CA.49A427A4@mvista.com> 
References: <39B7E0CA.49A427A4@mvista.com>  <39AF00C6.DA335C86@mvista.com> <39AC4D1F.BFBEEA21@mvista.com> <398F1287.E29C8ECE@matrox.com> <31647.965720843@cygnus.co.uk> <9503.967625312@cygnus.co.uk> <19439.968073410@passion.cygnus.co.uk> 
To: Alice Hennessy <ahennessy@mvista.com>
Cc: mtd@infradead.org
Subject: Re: get_module_symbol 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 08 Sep 2000 08:34:36 +0100
Message-ID: <3322.968398476@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Turn off CONFIG_MODVERSIONS or fix the places where it calls 
get_module_symbol() to somehow use the correct string.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
