Received: from ug-out-1314.google.com ([66.249.92.175])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hnyjj-0002Hm-6h
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 11:14:54 -0400
Received: by ug-out-1314.google.com with SMTP id m2so1179403uge
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 May 2007 08:14:49 -0700 (PDT)
Message-ID: <625fc13d0705150814j40e574dbp170b8f8479e404c7@mail.gmail.com>
Date: Tue, 15 May 2007 10:14:49 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: When to use mtd.h or mtd-user.h
In-Reply-To: <loom.20070515T170629-855@post.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <loom.20070515T170629-855@post.gmane.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/15/07, MikeW <mw_phil@yahoo.co.uk> wrote:
> I note some applications for running in userspace say:
> #include <linux/mtd/mtd.h>

Er, which ones?  I don't see anything in mtd-utils that does that.

> and some say
> #include <mtd/mtd-user.h>
>
> Which is the recommended usage, and why ?

mtd-user.h because it's been sanitized for inclusion in userspace.

josh
