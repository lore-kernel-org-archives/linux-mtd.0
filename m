Subject: Re: [RFC PATCH v2 2/2] mtd: rawnand: meson: add support for Amlogic
 NAND flash controller
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Yixun Lan <yixun.lan@amlogic.com>, <linux-mtd@lists.infradead.org>, Rob
 Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Richard Weinberger
 <richard@nod.at>, <linux-kernel@vger.kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Jian Hu <jian.hu@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
 <linux-amlogic@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
References: <20180719094612.5833-1-yixun.lan@amlogic.com>
 <20180719094612.5833-3-yixun.lan@amlogic.com>
 <20180801235045.5b4d8211@bbrezillon>
 <42877a0d-9830-0626-3f64-e49a326eaa3c@amlogic.com>
 <20180817155608.5929b37a@bbrezillon>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <96e538a5-1232-11f2-8b9e-5ddb09dcc2de@amlogic.com>
Date: Wed, 22 Aug 2018 22:08:42 +0800
MIME-Version: 1.0
In-Reply-To: <20180817155608.5929b37a@bbrezillon>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

There is a question below. please see my comments.

Thanks.

On 8/17/2018 9:56 PM, Boris Brezillon wrote:
> On Fri, 17 Aug 2018 21:03:59 +0800
> Liang Yang <liang.yang@amlogic.com> wrote:
> 
>> Hi Boris,
>> On 2018/8/2 5:50, Boris Brezillon wrote:
>>
>>> Hi Yixun,
>>>
>>> On Thu, 19 Jul 2018 17:46:12 +0800
>>> Yixun Lan <yixun.lan@amlogic.com> wrote:
>>>
>>> I haven't finished reviewing the driver yet (I'll try to do that later
>>> this week), but I already pointed a few things to fix/improve.
>>>   
>>>> +
>>>> +static int meson_nfc_exec_op(struct nand_chip *chip,
>>>> +			     const struct nand_operation *op, bool check_only)
>>>> +{
>>>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>>>> +	struct meson_nfc *nfc = nand_get_controller_data(chip);
>>>> +	const struct nand_op_instr *instr = NULL;
>>>> +	int ret = 0, cmd;
>>>> +	unsigned int op_id;
>>>> +	int i;
>>>> +
>>>> +	for (op_id = 0; op_id < op->ninstrs; op_id++) {
>>>> +		instr = &op->instrs[op_id];
>>>> +		switch (instr->type) {
>>>> +		case NAND_OP_CMD_INSTR:
>>>> +			cmd = nfc->param.chip_select | NFC_CMD_CLE;
>>>> +			cmd |= instr->ctx.cmd.opcode & 0xff;
>>>> +			writel(cmd, nfc->reg_base + NFC_REG_CMD);
>>>> +			meson_nfc_cmd_idle(nfc, NAND_TWB_TIME_CYCLE);
>>
>>>> +			meson_nfc_drain_cmd(nfc);
>>> I don't know exactly how the NAND controller works, but it's usually
>>>> +			break;
>>>> +
>>>> +		case NAND_OP_ADDR_INSTR:
>>>> +			for (i = 0; i < instr->ctx.addr.naddrs; i++) {
>>>> +				cmd = nfc->param.chip_select | NFC_CMD_ALE;
>>>> +				cmd |= instr->ctx.addr.addrs[i] & 0xff;
>>>> +				writel(cmd, nfc->reg_base + NFC_REG_CMD);
>>>> +			}
>>>> +			break;
>>>> +
>>>> +		case NAND_OP_DATA_IN_INSTR:
>>>> +			meson_nfc_read_buf(mtd, instr->ctx.data.buf.in,
>>>> +					   instr->ctx.data.len);
>>>> +			break;
>>>> +
>>>> +		case NAND_OP_DATA_OUT_INSTR:
>>>> +			meson_nfc_write_buf(mtd, instr->ctx.data.buf.out,
>>>> +					    instr->ctx.data.len);
> 
>>
>>>> +			break;
>>>> +
>>>> +		case NAND_OP_WAITRDY_INSTR:
>>>> +			mdelay(instr->ctx.waitrdy.timeout_ms);
>>>> +			ret = nand_soft_waitrdy(chip,
>>>> +						instr->ctx.waitrdy.timeout_ms);
>>> Hm, i'd be surprised if the controller does not have a way to optimize
>>> waits on R/B transitions.
>>
>> When i delete the delay here, erasing operation will be failed.
>> Does it mean NFC send 0x70 to nand device when rb is busy(low)?
> 
> I was not even talking about the delay, but yes, mdelay() seems way too
> big. Remember that it's a timeout, and you usually don't have to wait
> that much. You can do ndelay(instr->ctx.delay_ns) before calling
> nand_soft_waitrdy() to make sure tWB is enforced.
> 
> Anyway, that's not what I was initially referring to. What I meant is
> that nand_soft_waitrdy() should be replaced by native R/B pin or status
> polling wait logic so that the CPU is released while waiting for a R/B
> transition.
> 
>> If so, i will ask our NFC designer for comfirmation or grasping the waveform.
> 
> You have to wait tWB, that's for sure.
> 
we have a maximum 32 commands fifo. when command is written into 
NFC_REG_CMD, it doesn't mean that command is executing right now, maybe 
it is buffering on the queue.Assume one ERASE operation, when 2nd 
command(0xd0) is written into NFC_REG_CMD and then come into 
NAND_OP_WAITRDY_INSTR, if I read the RB status by register, it may be 
wrong because 0xd0 may not being executed. it is unusual unless 
buffering two many command.
so it seems that i still need to use nand_soft_waitrdy or wait cmd is 
executed somewhere.
>>
> 
