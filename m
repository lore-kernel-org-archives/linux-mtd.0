Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LV0VN-0000a7-UR
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2009 09:26:44 +0000
Subject: Re: 3GB limit?  *2* GB limit?!
From: Artem Bityutskiy <dedekind@infradead.org>
To: Miles Nordin <carton@Ivy.NET>
In-Reply-To: <oqab92rqd4.fsf@castrovalva.Ivy.NET>
References: <oqvdrrrpaf.fsf@castrovalva.Ivy.NET>
	<1233733240.5138.28.camel@localhost.localdomain>
	<oqab92rqd4.fsf@castrovalva.Ivy.NET>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Feb 2009 11:26:35 +0200
Message-Id: <1233825995.17790.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-02-04 at 13:47 -0500, Miles Nordin wrote:
> >>>>> "ab" == Artem Bityutskiy <dedekind@infradead.org> writes:
> 
>     ab> MTD user-space interface is 32-bit, and is simited by
>     ab> 2GiB. You have to upgrade it to use larger devices.
> 
> I am using mtd-tools from git, pulled a couple days ago.  or thought I
> was.  What do you mean by upgrade?  Do you mean ``redesign the
> interface and rewrite the tools'' or ``use Linux/amd64'' or ``pull
> something else from git''?

Miles,

please, glance at the include/mtd/mtd-abi.h file. This file defines the
interface between user-space applications and MTD devices. Notice that
the "size" field in the "struct mtd_info_user" data structure is 32-bit.
So the size of the MTD device is limited by 4GiB. Look at other data
structures and notice a similar thing.

Thus, you have to invent a new user-space interface for MTD. Internally,
it is 64-bit already. You do not have to have amd64. You have to code,
unfortunately.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
