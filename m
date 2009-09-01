Message-ID: <4A9D127F.4020109@gmail.com>
Date: Tue, 01 Sep 2009 15:24:31 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] UBIFS: add inode size debugging check
References: <1251806493-2476-1-git-send-email-dedekind@infradead.org>
In-Reply-To: <1251806493-2476-1-git-send-email-dedekind@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <Adrian.Hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/01/2009 03:01 PM, Artem Bityutskiy wrote:
> From: Artem Bityutskiy<Artem.Bityutskiy@nokia.com>
>
> This patch adds one more check to UBIFS - a check that makes
> sure that there are no data nodes beyond inode size.
>
> Signed-off-by: Artem Bityutskiy<Artem.Bityutskiy@nokia.com>

FYI. I've also pushed this and 2 other patches which I sent you
earlier to ubifs-2.6.git/master.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
