Received: from ug-out-1314.google.com ([66.249.92.172])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FwIoF-0002k7-Gr
	for linux-mtd@lists.infradead.org; Fri, 30 Jun 2006 09:13:34 -0400
Received: by ug-out-1314.google.com with SMTP id q2so310898uge
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 Jun 2006 06:13:21 -0700 (PDT)
Message-ID: <625fc13d0606300613q770a7f8cq57d90eea42255df@mail.gmail.com>
Date: Fri, 30 Jun 2006 08:13:21 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Angelos Manousarides" <amanous@inaccessnetworks.com>
Subject: Re: MTD device with multiple regions & JFFS2
In-Reply-To: <44A519A8.4030800@inaccessnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <44A519A8.4030800@inaccessnetworks.com>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/30/06, Angelos Manousarides <amanous@inaccessnetworks.com> wrote:
>
> The code in mtdconcat does transfer the region info to the resulting
> device, I see a mtd device with 2 (or 4 regions). The partitioning code
> however does not. "numeraseregions" is 0 and "erasesize" is only used.
>
> While I was trying to fix the code in mtdpart.c, I discovered that this
> is futile. The JFFS2 code does not seem to support this as well. Only
> the "erasesize" is used there also. Does that mean that I cannot have a
> JFFS2 filesystem that spans across multiple block size flash space?

Were you trying to fix it for "correctness", or is there a real
problem here?  JFFS2 is known to work on Intel P30 chips without
requiring it to understand the multiple erasesizes.  The chip command
set driver should handle this.

Btw, you forgot to mention what kernel you're running.  I'm assuming a
fairly recent one since you didn't say you had to backport P30 support
or anything like that.

josh
