Message-ID: <54A0C70D.7040706@huawei.com>
Date: Mon, 29 Dec 2014 11:14:21 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>
Subject: Re: [PATCH V6] UBI: Extend UBI layer debug/messaging capabilities
References: <1415023112-21704-1-git-send-email-tlinder@codeaurora.org>
In-Reply-To: <1415023112-21704-1-git-send-email-tlinder@codeaurora.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/11/3 21:58, Tanya Brokhman wrote:
> If there is more then one UBI device mounted, there is no way to
> distinguish between messages from different UBI devices.
> Add device number to all ubi layer message types.
> 
> The R/O block driver messages were replaced by pr_* since
> ubi_device structure is not used by it.
> 
> Amended a bit by Artem.
> 
> Signed-off-by: Tanya Brokhman <tlinder@codeaurora.org>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
> Changes from V1:


Hi Artem and Tanya,

Do you think the similar effort is worth to be done on ubifs-level?

We could have several ubifs partition mounted on a host.

Thanks,
Hu
