Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vzzi-0004AI-00
	for <linux-mtd@lists.infradead.org>; Sat, 05 May 2001 12:13:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NEBBIDMHCLDPHDHEGDMLKEGLCBAA.jasonw@uswo.net> 
References: <NEBBIDMHCLDPHDHEGDMLKEGLCBAA.jasonw@uswo.net> 
To: "Jason Walker" <jasonw@uswo.net>
Cc: "MTD Mailing List" <linux-mtd@lists.infradead.org>
Subject: Re: MTD and 2.4 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 05 May 2001 12:13:27 +0100
Message-ID: <2086.989061207@redhat.com>
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

jasonw@uswo.net said:
>  perhaps rdev'ing the 2.4 kernel I am working on would be a better
> approach. 

Or just pass 'root=/dev/nftla1' on the command line, making sure the LILO 
doesn't try to be clever. I think you need to use 'append=' for that.

You have to make sure that nftla is in the root device table in init/main.c 
for that, too.

--
dwmw2
