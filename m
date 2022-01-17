Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04EEC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 06:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:From:To:Date:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tQkr0XyvaGAIle2jBcts1gxpcIJ71HBVD1tm1hhO3I=; b=XBw5VvIvQ4m6wyisMh2khq6AOs
	h62cyWFprE+EIYj7VVzLPU6BnT+Gx3WZ3DZLwjq6I8vDU6WVpv0SpcWtftwITweIZWo8YOIJf/V5P
	OuTxN7dyPEee3P2duWQD2cUijC5FiZL1MmpWjkMX8pRj+1Sd+2xO+DvGVOW9ZQ7O6WEYAi53sdD3w
	AWOsaoQhqP6VVlohG4AjH5vsR84cUnE1Y+Cw03KRNG54QIfEraQAEpBWvteAtcNKtn2pRwUt7ZBAy
	NRr5xb8vzZPSFTmDwFWPIzuLJKsnzOKdON4rm9no8XN5v1RQMVR4/GoWwuHvHYriSiZKTwryHjoIT
	1tTyyo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9LEm-00DcxA-VO; Mon, 17 Jan 2022 06:11:29 +0000
Received: from mail-4323.proton.ch ([185.70.43.23])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9LEi-00DcuB-1A
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 06:11:26 +0000
Date: Mon, 17 Jan 2022 06:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-star.at;
 s=protonmail2; t=1642399877;
 bh=UU/Qbl64hhg0kZkxYwlpIijUKiKTp+N4i9ANE4YKw4A=;
 h=Date:To:From:Reply-To:Subject:Message-ID:In-Reply-To:References:
 From:To:Cc;
 b=R3XwlcMyVnZx3IeUlMBXqZ+Z7sEsFSMhNv2/fsYyx/QEyUspH1XV6dJMKSlYlkDU5
 +NaxXl3WsYfCTx23hS2x3DbnawylsVoZpD0PMdL3+HkVkoJ0tWcbhb1LAKQ/t+N+EA
 Jn+GnNmtwGQb0rxDeueLEgOeFinz0BHe37Wxd4gx3BRAmQIKz2rD4TDP9Xp00WSfxP
 y3PI28h3O8JhTJT38rG+KwlYniJSAhj1x0VGthNshSmt6a4djh2+ompRG0gNtX4ts3
 O9s/7XsRjkS1s8+mWeEueTmF6K+zz7d6FEOS8UfCP/V7dTLiRmnyUceG3FgIPsj1+6
 95UbaneuO/NEg==
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 MTD Mailing List <linux-mtd@lists.infradead.org>,
 Alexander Dahl <post@lespocky.de>,
 Buildroot Mailing List <buildroot@busybox.net>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: Re: [Buildroot] [ANNOUNCE] mtd-utils-2.1.4 is released
Message-ID: <816f8625-a002-e3b5-8065-c61e4affa431@sigma-star.at>
In-Reply-To: <20220110121715.GA6032@falbala.internal.home.lespocky.de>
References: <c31dba4f-42a8-ba48-7df2-b56bf4699a4c@sigma-star.at>
 <20220110121715.GA6032@falbala.internal.home.lespocky.de>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1_ciYA4Son1MuKBKCWsbRbc2ld0iGhrUqrMK8eQ80"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_221125_091597_07FD8358 
X-CRM114-Status: GOOD (  10.48  )
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
Reply-To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.

--b1_ciYA4Son1MuKBKCWsbRbc2ld0iGhrUqrMK8eQ80
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On 1/10/22 13:17, Alexander Dahl wrote:
> I tried to verify the gpg signature, but I could not find a public
> key. At https://keys.openpgp.org/ you only get a not working key:
>
>      gpg: key BCE5DC3C741A02D1: new key but contains no user ID - skipped
>

I originally uploaded the key to the MTD Key Server:

https://pgp.mit.edu/pks/lookup?op=3Dget&search=3D0xBCE5DC3C741A02D1

using the key from there I can verify the tarball on a clean Debian VM.
If I managed to tickle the new Thunderbird GPG support the right way (and
Protonmail doesn't mangle it somehow), this mail should also be signed.

> I also searched at http://www.linux-mtd.infradead.org/index.html and
> could not find a key, could you please point us to a recent version?
>

Yes, that sounds like a good idea. I will look into updating the
website and adding the key.

Greetings,

David

--b1_ciYA4Son1MuKBKCWsbRbc2ld0iGhrUqrMK8eQ80
Content-Type: application/pgp-keys; name=OpenPGP_0xBCE5DC3C741A02D1.asc
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=OpenPGP_0xBCE5DC3C741A02D1.asc

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tDQoNCnhzQk5CRlp5ZjBZQkNBREh5
S2hBQmh4dGhDQzluNDhwdnN1azVwM0lFZFlYTXM4QXBlbmgxTi9aNGNWaUF6L2QNCi9uU0NaK0ZH
RlgvUFN1YkV6cThBaWxaTGVqY2hBbHRhT1JDdkExWTZGZ1RscGNkSjZnSERmU3REYkpML3ZrNU4N
CjhhTDdZTkY3VmZqVFJudEJ0S2JoS2NyRzA1bmJkTmpJaW9BbTA0cHQ5cng1bVY1S01iZjIyL0Zk
WnBPU1NzQzYNCi9ON2IvY0ZIOStmeDhrd2k0cE5GdUp3ckJrV1J1UTdyRXRDb1NwZDIydCtWaDlx
QTdreW1XOWdXWTQwNTI1OGoNCm5ONjVqQk83RWxxVTJDQ3VHUlBnNnVyeUFIVjNSVkNCOWo5QUUz
SExhY1FSZUZ0dDV5bHl5ZFNRYmFLNEs5YXMNCm5kN1UyL0MxMXZJdXVjaVhDcHBYNGJQYXAvcE1u
R3B6dzBVTkFCRUJBQUhOTjBSaGRtbGtJRTlpWlhKb2IyeHMNClpXNTZaWElnUEdSaGRtbGtMbTlp
WlhKb2IyeHNaVzU2WlhKQWMybG5iV0V0YzNSaGNpNWhkRDdDd0hjRUV3RUkNCkFDRUZBbFp5ZjBZ
Q0d3TUZDd2tJQndJR0ZRZ0pDZ3NDQkJZQ0F3RUNIZ0VDRjRBQUNna1F2T1hjUEhRYUF0RnUNCkVB
Z0FyWE9oYW9hVnZDTVZDYTVOMjVRLytRNksxd3JWcFBta0g4OXloUXFDbWZNNmYrMlZNNU1HRkRQ
ZmFTSjMNCjVmQkRIMGl3QlF3bFhJYjdOU1hXdHpkWFg5ck12SmtKcXY0NVRnZUt0SkFwZi9zUmht
Y04rY2xyd3pQOG9aUWINCnhrUDFZV3pvVndvNGxPYjNLdjdhWTl5ZUNqcU5iZEpKNTdOcHZZT1Vy
enJDcEdrckRQQkJRT3ZLRjN3YnEzb1UNCi9vM2RUMjNORGVRMjBqWGdxdUpmL1BDdzZXQ3pSeHFn
NTh3SDAyTWRNRFFlOHZCeXpWaWcyYk0yZTdERXJ0dCsNCmhQSy9EbWRzcWducytaK1NyUWNPdlJh
M0dNQUhBdUhCMHUyTGhZTzZOeWFOQ2d6ZGd1dG9yaWxZY3E3RkVLcjgNClhxd09uZlZtWmRDVzNx
R0ttTGJuNnFNRWRNTEJYQVFRQVFJQUJnVUNWc1docFFBS0NSQm0rVm1GNnhpN3dWV1UNCkVBRExo
K0IrVnkrMzd2SjQ1ZTRmUVhTQUo4ejRyQlVrZ1AzU2REeFRLamwwNUZGRHVLaHg0NmJ1TkxuU2tt
QWwNCmYzOXRrcFJOdityMmlXS09QR01kVm1uYlNvTGlrNlU5c1J3WVZqUjRwUHVQanJtUldCTkhw
Tml2TWlrL3VPRmENCmtUcFAreE1ibk1rM3h6YWxsRkRJcndxaWNxYlVISzF1RkQvdk1NYjR1ZXVX
R3ZvTWtMZzZGM1VGMzVhcjBlQnUNCmJoSm5hZG5TMHFLN29vTVZCVUZhK0RSMmF1ODg1ZUk5ZXB5
Z1RjK1dpd2c3QkFVbjRtbldNQzRvRlJCdTRGcFkNCk1jVE5Yd2RjQ0xQSE5Gbk0xWElwcW5BaGRE
V2xsZjM3dzNTcyt4NVhNZzhFSVdLNGhKdk4rNU90TmtPeERwWGUNCk10QVRYWlozd2V4b0V3R2RI
OVhrc0pjMnp4Ym4yZVNIUUh2TFNwdTFXdjBLdW1MMmRKSTZzNDlNdWd0OXRBTk8NCktaelJ0RG5a
eGwzYW0ySVNRVzJ3clUzMmk1cEw4Y1RLcTVMZk1SMS9OQjU3RDZleUdaT1RNOW1UeCtoNXRja2oN
CkxuYjQ2QjNUYzh3NFgrRnlRZVZjRXlYZ2tpV1ZNendwcU1TUzEvZWw1Z3hrSVBjVHFwQXVLSmFa
SGtVaXpOYWoNCitJQ1pTVHNvcWs0RkZLN2p0dmd5NFFQUE5ITGFuaEJGdFVOT00xQzIvckJDaUx5
UkFEQkJGeitEL3dqVTNpVVYNCnBuamUyVGFGR3N1TmFCRENzREJON25xd3lmbGdBWjBoZTNPdnJC
VndvU1pyL293TWttWUd4d2JLV3A3cHhBZU8NClRTQWVaY2FIMG1ZQVFwelNlT2lDTURaTDBlOGQ4
VjFuNzQ4ZjRLN0NuVWRTQjg3QVRRUldjbjlHQVFnQXZ1Z0YNCjhjRmp2MlpzNEJCYjQ0U254R2F3
QnlTQzFiTVJhcy9NakE5RU1IVUF4L1N0Y2VjUW14bmw2QnpFeUdwcitUUm4NClhJemNiNXhJOFN4
aXRCRFU1TUx2d3NIZ052cFlwOWZzY2Q0a1dQN29NaXI5dGEzUThTdlQ0T0xiTzRGWkJHYVUNClJ6
R1BhazhKbWpNTXRPb09CaDRtZU9qejZHckplOVVJR3hUOTRhQjAxdzdZb2hmQkFOeks4eHlrNHlr
S0M1T3ANCjRYZ2FhTUtPRVFVYWg3d2FqY29qWVNsdmdPaVhxRWlzTUhsUkRBVzZzWEwyc0VNN1RJ
cHZZaHk5dHhNTGxscGsNClliMFB1MUJ2VXBZL3Vuc3liV0tBRnlpVG1laVkrbkV2ZVV2cVg2RWY3
QldkQ2xCZUNrMlVhUnZ0Y29MZDIyVngNCk1sS1RuaUhRY05NT1hsUlJhd0FSQVFBQndzQmZCQmdC
Q0FBSkJRSldjbjlHQWhzTUFBb0pFTHpsM0R4MEdnTFINClB0Y0gvakQ2cm4yK1ZJS2dySGR0M2Fv
M0FicHUyZnFZZndiSXlQQXRwWE9kZERwdFZxKzBBLzJhclhUMVk4K2oNCk5TWnBiQWc4SytiTGFF
QWNTVUVqdmlLTXBmSTdwcFRVQnVHS3JwZ2M1eHNpVXBLa0pDYjdvQjFacmFJQk5CUHQNClBQVlVo
YndMaWU0dVcvTFZ0KzhyQkt6M1c5S0VET3NUMFpDRy9wVzhMZCtFcERSOWwwZm1xb1ZIYXc4UGhM
QXQNCmV6K0I3SFM3SHY3aUpQRHRYODVrRllwdWQ4a0lQRU5YVm45RWpadWR5TVdnWmIyTGhZbGNh
dk5jc3pnUjdJbjYNCmlmdDVTTnlTb2pDT2ZBVjBpS1piOFFVWFdrdExsZVk4a1E4amx0T3NTUlR1
TzRQRGZ6dnRDUURpeFV3NHRRN1cNCkx3RFRxeVVwb3Qwb0cwM3Z0U0c0TElSQ2R4ST0NCj1VLzll
DQotLS0tLUVORCBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0t

--b1_ciYA4Son1MuKBKCWsbRbc2ld0iGhrUqrMK8eQ80
Content-Type: application/pgp-signature; name=OpenPGP_signature
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=OpenPGP_signature

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0Kd3NCNUJBQUJDQUFqRmlFRUV3WS9janll
V0VycXpWdWJ2T1hjUEhRYUF0RUZBbUhsQ0hjRkF3QUFBQUFBQ2drUXZPWGNQSFFhQXRHdA0KWFFm
OUVMeW1EcnV5dDRrRGsxYXUvM0RSWk9HY3g0Mi9xWUhPalNDNVg3MTExdTZxTkZIQ2Rrck5TT2dN
dzNsdnByb2h0MkdiN295Lw0KbWNVNi9GUmIvZy9GdFJPZTRHc3hDTG50ODV5N2ZoaEg2OStkaEsw
bGJmVVdxNnRqQU9HMy9Nd1ZqWGpqeVdYWm5DUlVZWmpNUW5pUw0Kbkg2bnBtZStxWkZKZXErbFRL
WnFiT015dUkzYmxuZGZTUHNhb2NNazBCVXZ3SHZDVWhSNVVSSmUvU0k0N3FRUVU4aXNhcGpieEZU
Rg0KNXE0Rm8yRGtBck5yakZrM3J2RUVST1FpVXBLa1MwQWJ0d1pWMlFGUGx6Yk9NWlU0WW5KZ3Qy
L3dINnZiRDdPOStjQWE4M1crZGk4Mg0KRXlteEhIYThhc2lwVFQzQ0lzWThlV0cxbSs2bnNwcVJR
YkU2dnpCUzlBPT0NCj00WDJDDQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg==

--b1_ciYA4Son1MuKBKCWsbRbc2ld0iGhrUqrMK8eQ80
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--b1_ciYA4Son1MuKBKCWsbRbc2ld0iGhrUqrMK8eQ80--


