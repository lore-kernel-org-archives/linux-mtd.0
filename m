Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e6kk2-0006nx-Cl
 for linux-mtd@lists.infradead.org; Mon, 23 Oct 2017 21:58:40 +0000
Subject: Re: [PATCH] mkfs.ubifs: make failure to list extended attributes
 quiet and non-fatal
To: Pavel Roskin <plroskin@gmail.com>, linux-mtd@lists.infradead.org
References: <20171020192807.25761-1-plroskin@gmail.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <0a20663c-99f6-40e5-edc4-bf1f23e9c4a6@sigma-star.at>
Date: Mon, 23 Oct 2017 23:58:12 +0200
MIME-Version: 1.0
In-Reply-To: <20171020192807.25761-1-plroskin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 10/20/2017 09:28 PM, Pavel Roskin wrote:
> mkfs.ubifs treats all errors returned by llistxattr() except ENOENT as
> fatal. In particular, if the host system doesn't support extended
> attributes, mkfs.ubifs would fail. It happens even without any flags that
> would explicitly request extended attribute support.
> 
Would it also work if we simply extended the check you patched to
test for ENOTSUP in addition?

Thanks,

David
