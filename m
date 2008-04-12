Received: from wf-out-1314.google.com ([209.85.200.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JkVYt-0008Bw-Se
	for linux-mtd@lists.infradead.org; Sat, 12 Apr 2008 02:33:52 +0000
Received: by wf-out-1314.google.com with SMTP id 29so745168wff.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Apr 2008 19:33:50 -0700 (PDT)
Message-ID: <9c9fda240804111933w2963db9bx3d78bdca46b1f1fc@mail.gmail.com>
Date: Sat, 12 Apr 2008 11:33:49 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: [PATCHJ] [MTD] [OneNAND] Allow for controller errors when reading
In-Reply-To: <47FF45EB.5070806@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <47FF45EB.5070806@nokia.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Apr 11, 2008 at 8:05 PM, Adrian Hunter
<ext-adrian.hunter@nokia.com> wrote:
> Controller errors while reading can be caused by
>  corruption caused by a previous powerloss. Because
>  upper level software like JFFS2 treat -EIO as fatal,
>  it is necessary to treat the error as an ECC error.
>

Umm interesting. You mean it occurs controller error before ecc error
at power loss case.
And it needs to define the terminology the Sudden Power Off Recovery
or POR shortly.
I'm not sure a previous powerloss means POR.

Anyway could you show the controller error value? Since it needs to
distinguish others e.g., initial bad blocks condition.

Thank you,
Kyungmin Park
