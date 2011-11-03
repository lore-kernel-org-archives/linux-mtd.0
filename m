Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RM1TE-0005rY-LW
	for linux-mtd@lists.infradead.org; Thu, 03 Nov 2011 17:52:57 +0000
Received: from [192.168.12.102] (190.sub-166-250-2.myvzw.com [166.250.2.190])
	by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id pA3HqsKj044082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Thu, 3 Nov 2011 10:52:55 -0700 (PDT)
	(envelope-from mikedunn@newsguy.com)
Message-ID: <4EB2D4C7.8020307@newsguy.com>
Date: Thu, 03 Nov 2011 10:52:07 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: nand: Add driver for M-sys / Sandisk diskonchip G4
References: <1320274859-3270-1-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1320274859-3270-1-git-send-email-mikedunn@newsguy.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/02/2011 04:00 PM, Mike Dunn wrote:
> This was tested against the latest mtd-2.6 kernel from the git repository on
> infradead.org, but I also verified that it builds against Artem's l2-mtd-2.6
> kernel.
>
>  

FYI...  this is incorrect.  Sorry, I goofed.  It will not build against the
l2-mtd-2.6 kernel, due to use of DEBUG macros in mtd.h.  I created the patch
against the wrong file.  Otherwise, the patch is good.  Next version will not
contain the DEBUG macros and will build against both kernels.

Thanks,
Mike
