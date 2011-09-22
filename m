Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R6nIt-00055u-Lz
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2011 17:43:20 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: Re: [PATCH V4] mtd: Add DiskOnChip G3 support
References: <1316633266-21312-1-git-send-email-robert.jarzmik@free.fr>
	<1316702729.4849.114.camel@sauron>
Date: Thu, 22 Sep 2011 19:42:59 +0200
In-Reply-To: <1316702729.4849.114.camel@sauron> (Artem Bityutskiy's message of
	"Thu, 22 Sep 2011 17:45:21 +0300")
Message-ID: <87mxdwiicc.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> Could you please re-base your driver on top of my l2 tree and fix
> warnings 0 I get the following:
Of course.

> BTW, the next step I'd do is to try to compile it with sparse, so you
> could test this driver with sparse: Documentation/sparse.txt
OK.

>> +#define doc_flashSequence(seq)						\
>> +do {									\
>> +	doc_dbg("doc_flashSequence: %02x " #seq "\n", DoC_Seq_##seq);	\
>> +	doc_writeb(DoC_Seq_##seq, DoC_FlashSequence);			\
>> +} while (0)
>> +
...zip...
>
> Could you please turn these macros into 'static inline' function - this
> is one of the modern patterns of kernel programming - we try to use
> functions for better type checking.
No sorry, that I cannot. If you look closely, the ##seq is not something you can
convert with an inline function, neither the #seq.

-- 
Robert
