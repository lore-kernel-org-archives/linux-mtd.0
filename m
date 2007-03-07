Received: from nf-out-0910.google.com ([64.233.182.188])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HP2GF-00028H-JG
	for linux-mtd@lists.infradead.org; Wed, 07 Mar 2007 14:57:22 -0500
Received: by nf-out-0910.google.com with SMTP id a4so319350nfc
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Mar 2007 11:57:09 -0800 (PST)
Message-ID: <625fc13d0703071157j21ddb16dy69f71924b83a17e1@mail.gmail.com>
Date: Wed, 7 Mar 2007 13:57:08 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Pete MacKay" <linux@architechnical.net>
Subject: Re: mtd-utils-1.0.1 for arm-linux?
In-Reply-To: <45EF17ED.8000908@architechnical.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <45EF17ED.8000908@architechnical.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/7/07, Pete MacKay <linux@architechnical.net> wrote:
> I've been unable to build this release (or the git code) with
> arm-linux-gcc 3.4.4 due to header problems and am desperately seeking
> binaries I can use with a OneNAND under 2.6.18 on a PXA-270.  (I didn't
> have these problems building mtd-utils-1.0.0 but get an oops writing a
> jffs2 image to a OneNAND partition with nandwrite).  Long story short we
> release in 6 days so I'm just seeking a newer nandwrite to try.

What build problems are you having?  We can't magically guess what they are.

josh
