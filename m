Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6dXS-000697-RN
 for linux-mtd@lists.infradead.org; Wed, 09 Dec 2015 12:08:08 +0000
Subject: Re: [PATCH] UBI: fix return error code
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
References: <1448014460-1371-1-git-send-email-sudipm.mukherjee@gmail.com>
 <564EF353.2050806@nod.at> <20151209120217.GE24852@sudip-pc>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <5668198B.3050504@nod.at>
Date: Wed, 9 Dec 2015 13:07:39 +0100
MIME-Version: 1.0
In-Reply-To: <20151209120217.GE24852@sudip-pc>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 09.12.2015 um 13:02 schrieb Sudip Mukherjee:
> On Fri, Nov 20, 2015 at 11:17:55AM +0100, Richard Weinberger wrote:
>> Am 20.11.2015 um 11:14 schrieb Sudip Mukherjee:
>>> We are checking dfs_rootdir for error value or NULL. But in the
>>> conditional ternary operator we returned -ENODEV if dfs_rootdir contains
>>> an error value and returned PTR_ERR(dfs_rootdir) if dfs_rootdir is NULL.
>>> So in the case of dfs_rootdir being NULL we actually assigned 0 to err
>>> and returned it to the caller implying a success.
>>> Lets return -ENODEV when dfs_rootdir is NULL else return
>>> PTR_ERR(dfs_rootdir).
>>>
>>> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
>>> ---
>>>  drivers/mtd/ubi/debug.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
>>> index b077e43..c4cb15a 100644
>>> --- a/drivers/mtd/ubi/debug.c
>>> +++ b/drivers/mtd/ubi/debug.c
>>> @@ -236,7 +236,7 @@ int ubi_debugfs_init(void)
>>>  
>>>  	dfs_rootdir = debugfs_create_dir("ubi", NULL);
>>>  	if (IS_ERR_OR_NULL(dfs_rootdir)) {
>>> -		int err = dfs_rootdir ? -ENODEV : PTR_ERR(dfs_rootdir);
>>> +		int err = dfs_rootdir ? PTR_ERR(dfs_rootdir) : -ENODEV;
>>>  
>>
>> Nice catch!
> 
> Hi Richard,
> It is still not on linus-next. Did you miss it?

I did not miss it, currently I'm traveling a lot and the
days before xmas are always super crazy here.
That's why I'm horrible backlogged.

Thanks,
//richard
