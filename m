Received: from ug-out-1314.google.com ([66.249.92.169])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HX09N-0005wR-Od
	for linux-mtd@lists.infradead.org; Thu, 29 Mar 2007 15:19:11 -0400
Received: by ug-out-1314.google.com with SMTP id m2so609550uge
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Mar 2007 12:19:03 -0700 (PDT)
Message-ID: <41483bfe0703291219m504ca1eenc8aeb43b970ffe81@mail.gmail.com>
Date: Thu, 29 Mar 2007 15:19:02 -0400
From: "harsh poshtiwala" <hiharsh@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Information about MTD
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi friends,

I need to know why do we need MTD?
Is it the Unix / Linux constraints that recognizes everything as a
file. I.e it has built in capability to communicate with different
files with read and wrtite operations only.

where as a flash has different operation i.e erase read, erase write and erase.

So to interface and communicate with flash devices unix / linux need
to have some translation mechanism which can  allow us to communicate
with FLASH?

How do these translation mechanism maps erase read , erase write and
erase operation in to simple read write operation?

Are there any other advantages / Disadvantages of MTD ?

I am not sure what kind of flash memory are supportted with MTD?

I have already read most of the document on
http://www.linux-mtd.infradead.org/index.html

is there any  other document that explains in detail about MTD?
--
Thanks & Regards
Harsh
-- 
Thanks & Regards
Harsh
