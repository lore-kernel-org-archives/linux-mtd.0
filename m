Received: from myyr.colleduc.ee ([193.40.113.30] helo=kiire.colleduc.ee)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BpSal-000489-5i
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2004 10:06:08 -0400
Message-ID: <41066111.7030903@smartlink.ee>
Date: Tue, 27 Jul 2004 17:05:05 +0300
From: Kalev Lember <kalev@smartlink.ee>
MIME-Version: 1.0
To: jigar shah <jigarshah121@rediffmail.com>
References: <20040727135724.30064.qmail@webmail46.rediffmail.com>
In-Reply-To: <20040727135724.30064.qmail@webmail46.rediffmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Question abt jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

jigar shah ::

>i want to execute " ftp client" binary utility 
>but when i execute it it give me error
>"No such file or direcotrey" though itis present in that directory
>  
>
Hi,

This is the message that is output if one or more libraries are missing. 
You can check it by running
# ldd <progname>

-- 
Best regards,
Kalev Lember
