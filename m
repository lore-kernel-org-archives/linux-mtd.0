Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G2UeZ-0006lx-1R
	for linux-mtd@lists.infradead.org; Mon, 17 Jul 2006 11:05:09 -0400
Received: by ug-out-1314.google.com with SMTP id u40so1756664ugc
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Jul 2006 08:04:51 -0700 (PDT)
Message-ID: <625fc13d0607170804i745f2566k8173ba5d85cad662@mail.gmail.com>
Date: Mon, 17 Jul 2006 10:04:51 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Davide CASCONE" <davide.cascone@st.com>
Subject: Re: nandwrite problem
In-Reply-To: <000301c6a9b1$998eb590$253682a4@nap.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <000301c6a9b1$998eb590$253682a4@nap.st.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/17/06, Davide CASCONE <davide.cascone@st.com> wrote:
>
> I have a NAND device related to MTD block 5. The NAND device is correctly probing during the kernel boot phase.
> If I run the following commands
>
> #mkdir /dev/mtdblock/5 b 31 5
> #mount -t jffs2 /dev/mtdblock/5 /nand/
>
> the JFFS2 file system is correctly mounting on the /nand/ directory.
> But, if I run the following command
>
> #./nandwrite -j /dev/mtdblock/5 filesys.jffs2_nand

nandwrite needs a character device, not a block device.  Use /dev/mtd5 instead.

josh
