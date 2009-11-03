Subject: Re: [PATCH 26/27] BKL: Remove BKL from ubifs
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jan Blunck <jblunck@suse.de>
In-Reply-To: <1257156307-24175-27-git-send-email-jblunck@suse.de>
References: <1257156307-24175-1-git-send-email-jblunck@suse.de>
	<1257156307-24175-27-git-send-email-jblunck@suse.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Nov 2009 07:47:02 +0200
Message-Id: <1257227222.21596.12.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Matthew Wilcox <matthew@wil.cx>, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>,
	linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
	Jens Axboe <jens.axboe@oracle.com>, linux-fsdevel@vger.kernel.org,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-11-02 at 11:05 +0100, Jan Blunck wrote:
> BKL is only used in get_sb. It is safe to remove it.
> 
> Signed-off-by: Jan Blunck <jblunck@suse.de>
Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
 
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
