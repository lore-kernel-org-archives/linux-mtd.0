Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDYA3-0003aZ-Qt
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 06:16:54 +0000
Subject: Re: [PATH] [MTD-UTILS] Return error if failure when reading from
	standard input
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nahor <nahor.j+gmane@gmail.com>
In-Reply-To: <h08vuc$uut$1@ger.gmane.org>
References: <h08vuc$uut$1@ger.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 08 Jun 2009 09:16:42 +0300
Message-Id: <1244441802.5847.337.camel@localhost.localdomain>
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

On Thu, 2009-06-04 at 10:23 -0700, Nahor wrote:
> The test to return SUCCESS or FAILURE at the end of nandwrite is done 
> only when reading from a file. When reading from the standard input, 
> nandwrite always returns success except for some cases at the begining.
> 
> This patches aims at fixing that by returning an error when jumping to 
> the closeall label.

Looks ok to me. Please, send an applicable patch.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
