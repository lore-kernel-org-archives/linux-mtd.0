Message-ID: <48CF5F19.8020105@nokia.com>
Date: Tue, 16 Sep 2008 10:24:09 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] [MTD] [OneNAND] OMAP2: add retry after read timeout
References: <48B274EB.4080004@nokia.com>
In-Reply-To: <48B274EB.4080004@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adrian Hunter wrote:
> Very occasionally, (about one in a million) read operations are
> ongoing after the timeout has expired.  So, retry three times
> while the ongoing bit remains set.
> 
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
> ---

Can I have this applied?
