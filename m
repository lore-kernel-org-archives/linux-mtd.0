Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bfI9-0003ID-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 11:40:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <009301c23c5d$c8a3d380$3064000a@nurpinar> 
References: <009301c23c5d$c8a3d380$3064000a@nurpinar> 
To: "nur" <nurpinar@basari.net.tr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: couldn't initialize doc2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Aug 2002 11:40:45 +0100
Message-ID: <941.1028544045@redhat.com>
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

nurpinar@basari.net.tr said:
> Using /lib/modules/2.2.18-rtl3.0-doc2000/block/doc.o 
> Cannot initialize M-Systems DOC 2000 OSAK

You are trying to use a binary module. In doing so, I believe you are 
violating the GPL. You will not get any help here.

On the other hand, if you want help trying to use the legal drivers which
are part of the Linux kernel, we will try to help you.

--
dwmw2
