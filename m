Subject: Re: [PATCH v5] mtd: Do not corrupt backing device of device node
	inode
From: David Woodhouse <dwmw2@infradead.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
In-Reply-To: <AANLkTikvuNiLD-n9Qvf10NmMU2KFQ25YPfM1oYfXtHE9@mail.gmail.com>
References: <AANLkTimB1DsCd8HuMDc9jgVOnOAE_PVd2ktssp3TIwxc@mail.gmail.com>
	<1274105441.6930.6920.camel@macbook.infradead.org>
	<1274182023.6930.7023.camel@macbook.infradead.org>
	<AANLkTikvuNiLD-n9Qvf10NmMU2KFQ25YPfM1oYfXtHE9@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 May 2010 13:45:06 +0100
Message-ID: <1274186706.6930.7213.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Jan Kara <jack@suse.cz>, Artem Bityutskiy <dedekind1@gmail.com>,
	linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
	Alexander Shishkin <virtuoso@slind.org>, linux-mtd@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-05-18 at 15:18 +0300, Kirill A. Shutemov wrote:
> > http://git.infradead.org/mtd-2.6.git/commitdiff/cd874237
>
> Looks ok. Thank you.
> 
> What about stable@? 

Ah, yes. For future reference, we should have included an explicit
'Cc: stable@kernel.org' in the commit itself, rather than just in the
email thread. As it is, we'll probably need to wait for it to hit Linus'
tree and then submit a backport to -stable. It'll need a slight massage
to apply to older kernels anyway.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
