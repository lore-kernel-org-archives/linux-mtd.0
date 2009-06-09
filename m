Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1ME0cn-0005Mb-MR
	for linux-mtd@lists.infradead.org; Tue, 09 Jun 2009 12:40:28 +0000
Subject: Re: [PATH] [MTD-UTILS] Return error if failure when reading from
	standard input
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jehan Bing <jehan@orb.com>
In-Reply-To: <4A2D3D26.4090703@orb.com>
References: <h08vuc$uut$1@ger.gmane.org>
	<1244441802.5847.337.camel@localhost.localdomain>
	<4A2D3D26.4090703@orb.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Jun 2009 15:39:50 +0300
Message-Id: <1244551190.5847.386.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-06-08 at 09:32 -0700, Jehan Bing wrote:
> Fix nandwrite to return EXIT_FAILURE in case of error when using the
> standard input instead of a file for input.

Pushed, thanks.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
