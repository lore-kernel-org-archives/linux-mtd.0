Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B7BD49C9B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 10:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1gd9Ew7iKXI+8CbjkOyUwvOJKd7vge8asFq3jPXZ2M=; b=lhGEuMLhSkWyn8
	+RE/rIed2CO/q4E/5Y5RPL3vJpzPq3kEXR0ltyiVjtfGqCkl6DVF6JeRcbCXXDBUv3eRIEJhxNZpX
	FxQeh6zmELet0yvJAui4XinBmghwAlqOA/Wz26IvMFxCfRm7p/C7ZOhCo+4bzsrRMyTnrkkRF07ZB
	lizWTc/INxXZ2B/qXHHj4v8XLG36qMg+SZcHbTzQZyRM6PD4x1V0ylWJPLPkReVl75hr37wDqn/cC
	subgzNvNkKZF/rNvis+xb/k3fKRm3GbqXXz9whEeNfvZU0ZkKFF/uY/tdVGPoKU8T1osinuWa1Z1i
	sV0Bimoswo8sTZutOnrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmE8-00000001LUv-3ofz;
	Fri, 30 Jan 2026 10:59:48 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmE5-00000001LU2-1yPc
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 10:59:47 +0000
X-QQ-mid: esmtpgz10t1769770732t176c8529
X-QQ-Originating-IP: L8IWA4HbVRjeQKViajbYKiM5sBQL3YPX8P/SIJYiBOs=
Received: from [192.168.0.109] ( [110.81.94.113])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Jan 2026 18:58:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3412299832332157637
EX-QQ-RecipientCnt: 11
Message-ID: <A87E0D60BEDCA22F+511dd411-a9a2-4894-8848-0c92ddf1a3ec@radxa.com>
Date: Fri, 30 Jan 2026 18:58:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] firmware: qcom: scm: Add SCM storage interface
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>,
 Junhao Xie <bigfoot@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <20260126-scm-storage-v2-v2-1-fa045c7e7699@radxa.com>
 <2d28b5d0-c5f4-4085-b2d0-18128b021416@oss.qualcomm.com>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <2d28b5d0-c5f4-4085-b2d0-18128b021416@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: Nx/b/ZER74yjVCCUvuY+g2WK/FESO45tChVmi5fuZcJrt04ObKWNvmHh
	HAgg42i7s6U9Gpgb7kbcZjo5auoiM7+LHsTetbrBkipVGTmG7m4e/VV3WA56lED0OBDJIgT
	At51sY8pnVJCd7twV06FvcOgq9epND6X94gCycyXJ+v7qT85WhmZSFBU7c9pABjMxynVwHD
	2TZyqCcDq74drgBobEo6/7nR8Se8dNzSOcz1F8dGP8aFUPFtvb8wPEBO5/9kB8fjJpPx99G
	h9xk1QkKkx9tMJzFkjXMjB3LTYX5ygTWXBHltf0yx8qcuqF8hTBrtW1dPR6gP6QXs0CgoSX
	gtOUiiLj6uC71FSx6Ko2nGYK+e2P1XLXcw88On84qjxzOaKB017w+UaxIBh1LuxKlrw5dur
	ToekkGoSwlUlBilL4lQjGldUEq9S+Yrmh6IGU80wYisRtagV+QEklSA0Ng6G+E/kBGsMeao
	76bxbahvbfS9Yo0zwrYBEBEDIUY7uVW/gwBmLAcmFYUBIehWKAyPiBo1hUV5wrDJFOtPLyW
	twoDHKcLCtw5JkNFTESlCTtgJ5wRWbNVdOtmDL6WriD1Isc07ivCZao669AqbI0jcHvLyK8
	Wp2OFLiobbxzA0rdlI4UGb5Ug97QhG90FJ/VmC9SPI+zAuOm0UxHgaKBjIuobk2N7jXYRst
	ZDQQAqh68sQZWd8/gl0t17lfPCT9ULH12KRhp/fHFHHaBK7nP2fO1L6/A4CuuTpfLTb7/4s
	xozbxu/qt9hw6JAqterowEcu13BfDlwoX4cMGbzXlHH566w1ummx5bM8i+KSBdj/2Nan4Do
	fnbM9TyM4CL0TnIImFlB2J24bzGSXqLjpvGGZMsUed1NIAauV8peC0TTAdakabHp23kpPXB
	wVRVpFtQoEhiISKt+GHIp7CniBuyuH/1dBjMS2hwxCLzj2SuHlCRiviAK9MXGHA9+Japetf
	FzFIGaWaOJTJm7rbpa30HhgTvtLFCYXsnuiLpW5xOKyABv310aznmjPTIB2ItRPDLkU+aXb
	mavk631aQJ/ENqtA03
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_025946_105174_428E806C 
X-CRM114-Status: GOOD (  20.14  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2026/1/28 21:39, Konrad Dybcio wrote:
> On 1/26/26 12:44 PM, Junhao Xie wrote:
>> Add infrastructure to support accessing TrustZone-protected storage
>> devices through SCM (Secure Channel Manager) calls. Some Qualcomm
>> platforms protect their firmware storage (typically SPI NOR flash)
>> via TrustZone, making it inaccessible from the non-secure world.
>>
>> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
>> Tested-by: Xilin Wu <sophon@radxa.com>
>> ---
> [...]
>
>> +int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
>> +			      enum qcom_scm_storage_cmd_id cmd_id,
>> +			      u64 lba, void *data, size_t size)
> Please add kerneldoc, as this is an exported function

I will add kerneldoc for qcom_scm_storage_send_cmd in v3

>> +{
>> +	struct qcom_scm_storage_payload *payload __free(qcom_tzmem) = NULL;
>> +	struct qcom_scm_res scm_res = {};
>> +	struct qcom_scm_desc desc = {};
>> +	phys_addr_t payload_addr;
>> +	size_t buf_size;
>> +	int ret;
>> +
>> +	buf_size = sizeof(*payload);
>> +	if (data)
>> +		buf_size += size;
>> +
>> +	payload = qcom_tzmem_alloc(__scm->mempool, buf_size, GFP_KERNEL);
>> +	if (!payload)
>> +		return -ENOMEM;
>> +
>> +	memset(payload, 0, buf_size);
> You're overwriting the data part a line below, let's just zero out the
> cmd+details (sizeof(*payload)) part
>
>> +	if (data)
> (please add a \n above - normally
>
> foo = xyz;
> if (abc)
> 	...
>
> implies the condition takes into account the previous line)

I will fix them in v3.

> [...]
>
>> +	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_STORAGE,
>> +					 QCOM_SCM_STORAGE_CMD))
>> +		return;
>> +
>> +	ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
>> +					QCOM_SCM_STORAGE_GET_INFO,
>> +					0, &info, sizeof(info));
> I'm curious what happens if the call is available but SPINOR is not
> populated onboard..
>
> I thiiiink it should return STORAGE_RESULT_INVALID_PARAMETER but I'm not
> a 100% sure. Guess we'll see down the road.

Yes, on platforms I tested (QCS6490 LE), it returns 
STORAGE_RESULT_INVALID_PARAMETER.

>> +	if (ret < 0) {
>> +		dev_warn(scm->dev, "scm storage get info failed: %d\n", ret);
>> +		return;
>> +	}
>> +
>> +	total_blocks = le64_to_cpu(info.total_blocks);
>> +	block_size = le32_to_cpu(info.block_size);
>> +
>> +	dev_dbg(scm->dev, "scm storage size %llu bytes\n",
>> +		total_blocks * block_size);
>> +
>> +	storage_dev = platform_device_alloc("qcom_scm_storage", -1);
> -1 is PLATFORM_DEVID_NONE
>
> Let's use PLATFORM_DEVID_AUTO to allow potentially multiple instances of
> this driver being spawned down the road

I will change it to PLATFORM_DEVID_AUTO.
But will they really have multiple instances?

> Konrad

Thank you for the review, I will incorporate these changes in v3.

Best regards,
Junhao Xie


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
