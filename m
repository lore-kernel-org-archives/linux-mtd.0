Received: from wx-out-0506.google.com ([66.249.82.227])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JbcTj-0005nO-8z
	for linux-mtd@lists.infradead.org; Tue, 18 Mar 2008 14:07:47 +0000
Received: by wx-out-0506.google.com with SMTP id s7so6076117wxc.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Mar 2008 07:07:44 -0700 (PDT)
Message-ID: <c384c5ea0803180707k4c9dd9e0m814e66ef6a309100@mail.gmail.com>
Date: Tue, 18 Mar 2008 15:07:42 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>,
	linux-mtd@lists.infradead.org
Subject: Re: [RFC] root=/dev/mtdblock@name
In-Reply-To: <c384c5ea0803180646w7334f15ch28d5e09cf0a33e15@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <c384c5ea0710190455h195aa8eeub0bc775da3377183@mail.gmail.com>
	<20071019143303.GD26913@lazybastard.org>
	<c384c5ea0710191452x52ffdc74x2ce16d0faf62a11b@mail.gmail.com>
	<c384c5ea0803180646w7334f15ch28d5e09cf0a33e15@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

On Tue, Mar 18, 2008 at 2:46 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
>  CONFIG_CMDLINE=" root=/dev/mtd:rootfs rootfstype=jffs2"

Ah, the trick is /dev/ is not supported in the new approach.
root=mtd:name solves it.  Sorry for the noise.

Regards,
-- 
Leon
