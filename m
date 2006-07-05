Received: from ug-out-1314.google.com ([66.249.92.169])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fy5g5-00070R-Bs
	for linux-mtd@lists.infradead.org; Wed, 05 Jul 2006 07:36:32 -0400
Received: by ug-out-1314.google.com with SMTP id q2so1710875uge
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Jul 2006 04:36:19 -0700 (PDT)
Message-ID: <625fc13d0607050436r591a1857m348c8f64cc16e0b1@mail.gmail.com>
Date: Wed, 5 Jul 2006 06:36:19 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH 1/1] UBI
In-Reply-To: <1151408975.16490.12.camel@sauron.oktetlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1151408975.16490.12.camel@sauron.oktetlabs.ru>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/27/06, Artem B. Bityutskiy <dedekind@infradead.org> wrote:
> Hello,
>
> Frank announced about UBI some time ago
> (http://lists.infradead.org/pipermail/linux-mtd/2006-June/015887.html)
>
> The UBI GIT tree is now at git://git.infradead.org/ubi-2.6.git, or
> http://git.infradead.org/?p=ubi-2.6.git;a=summary at WEB.
>
> Here is the UBI patch for your review.

Thanks for sending this out.

Here's some questions:

Does the range for bad eraseblock reserve really need to be up to 1/2
the device?

Perhaps all the MTD_UBI_DEBUG options could be hidden in a seperate
Kconfig file that is sourced.  As it stands now, it's fairly bloated
for a large majority of options that won't get enabled.

Why all the forward declarations of structures in the various header
files?  Couldn't this be done by properly including the header files
that are needed?

This is a short list at the moment.  I need to find some more time to
dig into the patch.

josh
