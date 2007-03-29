Received: from nz-out-0506.google.com ([64.233.162.231])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HWupb-0003aL-LR
	for linux-mtd@lists.infradead.org; Thu, 29 Mar 2007 09:38:24 -0400
Received: by nz-out-0506.google.com with SMTP id i11so247267nzi
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Mar 2007 06:38:22 -0700 (PDT)
Message-ID: <41483bfe0703290638p4e9e04b5l61dbd46e20013f0d@mail.gmail.com>
Date: Thu, 29 Mar 2007 09:38:19 -0400
From: "harsh poshtiwala" <hiharsh@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Why do we Need MTD ?
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
Is it the Unix / Linux constarints that recognizes everything as a
file. I.e it has built in capability to communicate with different
files with read and wrtite operations only.

where as a flash has different operation i.e erase read, erase write and erase.

So to interface and communicate with flash devices unix / linux need
to have some translation mechanism which can  allow us to communicate
with FLASh?

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
