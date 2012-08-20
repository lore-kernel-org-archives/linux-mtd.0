MIME-Version: 1.0
In-Reply-To: <CACQ1gAgUdXj9KKtgjf=Lx0Kz2v18Xgz4RjiRQnKHMsf3m3THJw@mail.gmail.com>
References: <1345214124-5478-1-git-send-email-richard.genoud@gmail.com>
 <1345214124-5478-7-git-send-email-richard.genoud@gmail.com>
 <20120819122634.252f1ea5@pixies.home.jungo.com>
 <CACQ1gAgUdXj9KKtgjf=Lx0Kz2v18Xgz4RjiRQnKHMsf3m3THJw@mail.gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 20 Aug 2012 10:21:17 +0200
Message-ID: <CACQ1gAjqL3DS8e+Ya2xAKOBVuRjjyLPYU7xa74vTOKhyypHL2Q@mail.gmail.com>
Subject: Re: [PATCH 6/8] UBI: replace MTD_UBI_BEB_LIMIT with module parameter
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/20 Richard Genoud <richard.genoud@gmail.com>:
> 2012/8/19 Shmulik Ladkani <shmulik.ladkani@gmail.com>:
>> Hi Richard,
>>
>> On Fri, 17 Aug 2012 16:35:22 +0200 Richard Genoud <richard.genoud@gmail.com> wrote:
>>> +                   "MTD devices may be specified by their number, name, or path to the MTD character device node.\n"
>>> +                   "Optional \"vid_hdr_offs\" parameter specifies UBI VID header position to be used by UBI. (default value if 0 or not set)\n"
>>> +                   "Optional \"max_beb_per1024\" parameter specifies the maximum expected bad eraseblock per 1024 eraseblocks. (default value ("
>>> +                   __stringify(CONFIG_MTD_UBI_BEB_LIMIT) ") if 0 or not set)\n"
>>
>> Looks like "mtd=/dev/mtd1,,25" is invalid, although we state "default
>> value if 0 or not set".
> I'm going to check that.
I made a patch to accept empty string value.
I'll send it with the rest of the patch serie.

Regards,
Richard.
