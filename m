Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42314C021A1
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAARUhLHSqtVJcDFdJLy1cWnMvoCYfiT3WK1W3V7x8U=; b=rFOye62LG0zfPt
	KFKuzV2YCWqpSugrq2wztnbmvPDH+q9UgHqZtPos9zb2uAf9lUfUW5td7wy0SL5FFAUo17wNc7Fry
	bX9SajnNjK2kiZemYpXoMJpR2MTxMDoWHTRD7cUOqxvuA0vOeOjG0hqt6gQH38e/hJDS88QlL+ebK
	kE3HBv3A2KNJQLkUnZ35/e0KBOrJKvy/DXNffsG4pXWfXs+V5cipoGguLAByzvkmJ0cCxCqrOp2Hv
	jwbU2g1PcShWezl2eWfXF0GqzE3KQ66EwX6mvVMEIjIaCreg+E66l4l4yVm3sa6qP5J5dCtTJh2CV
	jXCg6n3L5Nq4/P2iq1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZZC-000000018Ar-3alO;
	Mon, 10 Feb 2025 19:35:38 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thZUz-000000015yN-2H5C
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 19:31:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGfv85l+uc0QdkprzPe+6xwUfnHync1TUwMxUHHOJFBJHp5vQhhr3+2MslQn5b18pgwfjqodxSWTG19LUp5NSC2OhGo+izCwObfkDGNK+y1/18APf9HUQ+VbO2fv4/2laYYEXcHOOi9RaqwsXp8lG1AsiPLqW0QMAqqgfOL/hZYxD+3YeTirlWwuJtgi3AddhP8EtPOAqfqmivu0SFJx3HpVVWy6vXw9ZqiA0VPDEqTNOyXO7tDjbACklKTK+YEMgLthJh4Ol3nQY/mXMqdS0h1jFfwBNjqcUGg8icyWr6aiuEd82FTYnu2R/vLX6wAsOyuSazs3xY/UNGiiEbi30w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUH04Zx+SK5nmXrHU5UNRd2OrW4RAyS470UJVbxyJgU=;
 b=I5Y8JaDSszwMVnIyfvYbzZB60ppwjL3NJMmKVve0M4PcrOb7jrbyn3TpfxdHhEfUGRYFjxBeJAxc2wA/DxHPbBYVAZCIzs1+S8zHfi+2I+VS7fGNS3gzBLIFGO96PMnAhAstDGmHRIqj3C/Aq0qfPIMz9IKAFZYp6TH3F3H48Zr+icS1wR99zIi8d0gA3ENLuLIq45uQiQk8SOBu5VKmDol1CTZS2H3s0IODuwRQASTjjitBbKvuCizQhVt8mKEJ66CHxLDompj2tyvilulEgb3HF9SDZdDFsnpIitB8L5W2Je6Wf9ZwVTeqrKJwkZYM4w2E//6AkrYDA7VTVZwpxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUH04Zx+SK5nmXrHU5UNRd2OrW4RAyS470UJVbxyJgU=;
 b=QyV9lo3HYvX1Jr5wSrJe87Jh2CIQzOn0nBjTI3tpItl13gk4GfjaqwHZPaHj91G+OMQpblNtpOrcRAjYcnPzGYAc1n2P5EHa//xx43usC1bap5TrWQoexofNq2kvs/8R49a+G8hRrH0GfCLUUAc9jYV+fselQ3N/v/uj1qAJ3IHlKynqBZHVkNftv5Vc30ly9PJMOZ3NNUfeKROECyO6SGsoRBsJyvyiWtgUG5n+6VK2P8mWpW+U6d0z45bx4WifhrwRa6cNcbv4peHG5Md+d0VsUCwgLJ5gNENGr8mO5o+49XdWbVguF/VyMSMtYNPSgc83aPd/jzWfoUl4QOAuog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7249.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 19:31:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 19:31:08 +0000
Date: Mon, 10 Feb 2025 14:30:54 -0500
From: Frank Li <Frank.li@nxp.com>
To: j.ne@posteo.net
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 03/12] dt-bindings: crypto: Convert fsl,sec-2.0 to
 YAMLy
Message-ID: <Z6pT7mR1itWOtVfb@lizhi-Precision-Tower-5810>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-3-8137b0c42526@posteo.net>
Content-Disposition: inline
In-Reply-To: <20250207-ppcyaml-v2-3-8137b0c42526@posteo.net>
X-ClientProxiedBy: SJ0PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9cd9f4-15b3-44a0-e1ce-08dd4a097819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KH3L08NHvpeBna5BnIeMK8tL5Dvl3ktvAvx8lLKeWIkY9mP3EoFOkDqEwv?=
 =?iso-8859-1?Q?6bc5XxHRFCpGbF1CFm+l/Cbb54cuDcP8HgapmyPHLmIbq90MHFtT6y8t0o?=
 =?iso-8859-1?Q?cPLcwQq0IASAUN8Pngs5hCsfVh1Pxxyt74Hk1pTniysIsWc0MKj5HyKJaz?=
 =?iso-8859-1?Q?MWK32gFZMOdM3JwvCU+m+Jc2vQwshS+eHDs2E8ruBYJfYI0tshIygp4+U2?=
 =?iso-8859-1?Q?NM5tNPK++tGsXJFJIePjOvrEkGrJbJ55gykXmrZ92bK4l07dhpzsWFAXTo?=
 =?iso-8859-1?Q?N4oR2T8GnSvyV/+gR3X5PVGGxWs4lRXtjiey1U894eqLrT2jP2JkEH7kMg?=
 =?iso-8859-1?Q?TAeKXk1NsiqKSjljAckyD9hrnhMaFEvM9rc2a5gFZj8YWV3Ls2IbFa7Qke?=
 =?iso-8859-1?Q?A1l9878plQDXjWsNWZjvaP38mrW2Uecea8VWec/M2lNO5yUbroF8v4MaVW?=
 =?iso-8859-1?Q?ygw7JfLJaaUDVBdLcVUA2U9clRbRM7kVqtBY6EPJftwZd5ZoZE9L1R9P/k?=
 =?iso-8859-1?Q?MDDpJpzSNCjGzNTV/UrOYFqEtkYlWJK5ymmegjo3GS4lGBvCVqsxsv1gOn?=
 =?iso-8859-1?Q?XcsjfMWkWj4McG+KhnTWZFl6X6mgqRQD8cHLzj4KL7nH9MOZ4MoeONc7OT?=
 =?iso-8859-1?Q?SX4gu8vltZgjYzdNAPmMwwFwEC5Yx/2i9sg7tqPoAwwQLoa/NtRK1Pe3X2?=
 =?iso-8859-1?Q?jXBnl9n+kkerOG0cxR8ETej8kbnljEWWq7FFsxsmC4xDtgy2EEQM4aMawk?=
 =?iso-8859-1?Q?QwLgahicrqLra5jLD7l1mnQj9tR4zBH8XW86gVFAKwqOKD1ZogDGNj/0EV?=
 =?iso-8859-1?Q?os2uaXVCtD/52b65JMuT3DBhB6RlINobn8F/10HGMekxY34fXdQe4YMTvW?=
 =?iso-8859-1?Q?vwiiZY3DdDKEQ55N1vNhJQlCdbZ+L3/yUFUnK/oWrRGTTNH82jMtlOb+Lk?=
 =?iso-8859-1?Q?352wJSysUu8hEby0tcek/UVa+sxVZHP0yttoOxdA7v7VlZaUXEsHsUDhA9?=
 =?iso-8859-1?Q?a2H2s18eUZFgszihkoSqL79dizyeKvbWH3rV8gBWoOAz9Dbcc+7Wn2zg15?=
 =?iso-8859-1?Q?5xRaH0rghnFcyeLP8z/HODZ3xbQaYJAnHmYVy8ber1eZ1njV20CjysKcrx?=
 =?iso-8859-1?Q?g9U4KRahZXp11nyunHMRZLtk/fw8MfPuyJW3FUYFeVo2JW6y2ESnQqhItI?=
 =?iso-8859-1?Q?FhH4D723XloQcBFtkhbUqJCO+lElfISp3GBoCHUovm8SWY/xo+EyJFvfNZ?=
 =?iso-8859-1?Q?587U0ElLGpq26SDaM9NGomz0ZDVDlV9z9DbuFm0DrjFYDLM8tqC9XqC6R3?=
 =?iso-8859-1?Q?EK4O7GjRQODqSsNRFFP+kmjFx4Sc+Gz/HsR0oMUVAfnD54G/PWaK1wVXLA?=
 =?iso-8859-1?Q?jwSL3jxq4oHoR6lrwin+W5hlH9YYPIgA0ChOnZhRtqo3S+eitXbDP75TgR?=
 =?iso-8859-1?Q?jINgF2VXPCeer/OT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jmPEnuHU//Z+oyw4CZHC3ipnqunMJ7apDRyE1Ex7uGMk0hcfUL3PUn/AZC?=
 =?iso-8859-1?Q?UMhttsK7GVEnQo0w4FFlBHSEF03bv4OOn9BqZs4SeEanvc8vRLomZ3S/nb?=
 =?iso-8859-1?Q?CLH1wXcBNbhist6LpjgpXGbvrW/+ArZdU1gZwM1ooj5+JokUXMUe4FFm9Y?=
 =?iso-8859-1?Q?poR7y/mdvHp+z+smP+0r3VPhsJPsNYn9a+wRvkfV88DuIYmCSKNiBvq0hZ?=
 =?iso-8859-1?Q?NXqzo/f6EvMcN6ZU+1P8rMi2WeRLXf/f4eIT3eJD+PRnH8517TB9FrKLW5?=
 =?iso-8859-1?Q?3O6GM1xkUEUYbIXGhUii84yMoocD8DMznmOc+N4dWknE0z3+mIprJ7DPB6?=
 =?iso-8859-1?Q?RslqeEt4EQQT2ikDcLNaWjytdbRT8/U5Dbnl0rZLnbYXMWbbMA95NtMbx5?=
 =?iso-8859-1?Q?Bmm9G6LdTvI9QizDS2CDN2nz5vayto8CPX/zaeQFIgolnJmfpjbyMk6xwM?=
 =?iso-8859-1?Q?XjeDg6JMsjfbTiyUaH4/ZdxYHLaN3qDyUZPfPNflYcIXvXv3dQtHloYU4/?=
 =?iso-8859-1?Q?aJ822yAW/fTTyL7DjG4iJgibyACaBeHc7/bk4XOxBvZNq84A+gbK5UumBZ?=
 =?iso-8859-1?Q?IjW6N7qQ93JmFCr+2q/uw5QT70QtP7sihiN+/9aImME7qse7elombLVg4O?=
 =?iso-8859-1?Q?W4Dim6YG0mROUqHY9Dir4xRPPKBuzHFJkWI31DLmFejIHxlBDsmkFLMQEA?=
 =?iso-8859-1?Q?kZjkePV1Z+TICHo1gV5EPuSMbfHOkhF63X76GcgxlgeGxZHGZdlG8Lwgwm?=
 =?iso-8859-1?Q?h0GeJb5dKvO0Q/xN6AF2m922+X0ihUxTVbRD/2J0/IV+onjMRH2UcgVwWj?=
 =?iso-8859-1?Q?zuGKfMNNShCz31QQd2cQWloLPiWCExnYrxIUHuleOjBRto2AEh/uMGZOiI?=
 =?iso-8859-1?Q?HmItmgnvJGhXN1zkl5v6Z5euug77NanwcLFCSCMACVyhnteihZJo43t+Wp?=
 =?iso-8859-1?Q?QjJjDzqsGpTbVbpf7Ch1eCOsrwM5truwI5W5lRwVgsw4bCi8FwI7IuuKR0?=
 =?iso-8859-1?Q?35NvSTro7Rm4bx9ODkZOuoI+Psn/ka1BZVPJMopQxMj6l7aEc/v48lpBuP?=
 =?iso-8859-1?Q?pFXEPyxOcQBfXTD8D3LWGYKGIJTUPrVy6cqvyAuSzyGrfLwNeUhDRdihlQ?=
 =?iso-8859-1?Q?VXlje3GSRbegpVSt6CjTfNHm42KM4961JVuKDlqnIIYdjJWjuUb40lzYo8?=
 =?iso-8859-1?Q?KU80PdLVcWKj+IMFoGE6IaVEZJ+9agVzPQaFLt9sgkybCD6mLS1/AZulWm?=
 =?iso-8859-1?Q?NHAlEd2was3kFWYw0mlc9ABnAO0wCnoJT8eksZn4bFlE0iQ/xOSJEMflB+?=
 =?iso-8859-1?Q?D+VGJf0TTe27GQ0ZvHnAz3oXq8io4jt/umBrIIYTpihZ0fIRzH+X5AYu+x?=
 =?iso-8859-1?Q?9+fwvG+6tANMjCoNjanBBaPR2kHWVb/gRnh6SwNKny/lFo6t5k+FcbY43a?=
 =?iso-8859-1?Q?H+9cqAvZ3UYPaO6AdBc+dw2L/q9N0bQXlXLIM+JvKys3gqdvujyTNmEghd?=
 =?iso-8859-1?Q?5/6HD2+bMqlURxubvSpB1Gj8P4F1iLAF9Dh5F7r/I/wa6yo0MbuKEyeO8v?=
 =?iso-8859-1?Q?2nmZ2L2BymC2j6NEBsoxUw1+t3Ri9hz/6HAbcHLgjV/WglZ7ILVF4f7B6X?=
 =?iso-8859-1?Q?LsaFHn9fld/ns=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9cd9f4-15b3-44a0-e1ce-08dd4a097819
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:31:08.7971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byxaJDM39Rd0RuGVD7MXb3+2gZdV0aGFEF8MzKEhYaCJ9vf1/4habV/jeqTnNBfFJsyaqZ1YqFZPCPuq6+rDzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7249
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_113117_743010_B1029757 
X-CRM114-Status: GOOD (  20.45  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 07, 2025 at 10:30:20PM +0100, J. Neusch=E4fer via B4 Relay wrot=
e:
> From: "J. Neusch=E4fer" <j.ne@posteo.net>
>
> Convert the Freescale security engine (crypto accelerator) binding from
> text form to YAML. The list of compatible strings reflects what was
> previously described in prose; not all combinations occur in existing
> devicetrees.
>
> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>
> V2:
> - several improvements suggested by Rob Herring:
>   - remove unnecessary multiline markers
>   - constrain fsl,num-channels to enum: [1,4]
>   - constrain fsl,channel-fifo-len to plausible limits
>   - constrain fsl,exec-units-mask to maximum=3D0xfff
> - trim subject line (remove "binding")
> ---
>  .../devicetree/bindings/crypto/fsl,sec2.0.yaml     | 142 +++++++++++++++=
++++++
>  .../devicetree/bindings/crypto/fsl-sec2.txt        |  65 ----------
>  2 files changed, 142 insertions(+), 65 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml b/D=
ocumentation/devicetree/bindings/crypto/fsl,sec2.0.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0b82f3b68b5f82e7fb52d292a=
623d452c1cdb059
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale SoC SEC Security Engines versions 1.x-2.x-3.x
> +
> +maintainers:
> +  - J. Neusch=E4fer <j.ne@posteo.net.
> +
> +properties:
> +  compatible:
> +    description:
> +      Should contain entries for this and backward compatible SEC versio=
ns,
> +      high to low. Warning - SEC1 and SEC2 are mutually exclusive.
> +    oneOf:
> +      - items:
> +          - const: fsl,sec3.3
> +          - const: fsl,sec3.1
> +          - const: fsl,sec3.0
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec3.1
> +          - const: fsl,sec3.0
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec3.0
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec1.2
> +          - const: fsl,sec1.0
> +      - items:
> +          - const: fsl,sec1.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  fsl,num-channels:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 1, 4 ]
> +    description: An integer representing the number of channels availabl=
e.
> +
> +  fsl,channel-fifo-len:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 100
> +    description:
> +      An integer representing the number of descriptor pointers each cha=
nnel
> +      fetch fifo can hold.
> +
> +  fsl,exec-units-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 0xfff
> +    description: |
> +      The bitmask representing what execution units (EUs) are available.
> +      EU information should be encoded following the SEC's Descriptor He=
ader
> +      Dword EU_SEL0 field documentation, i.e. as follows:
> +
> +        bit 0  =3D reserved - should be 0
> +        bit 1  =3D set if SEC has the ARC4 EU (AFEU)
> +        bit 2  =3D set if SEC has the DES/3DES EU (DEU)
> +        bit 3  =3D set if SEC has the message digest EU (MDEU/MDEU-A)
> +        bit 4  =3D set if SEC has the random number generator EU (RNG)
> +        bit 5  =3D set if SEC has the public key EU (PKEU)
> +        bit 6  =3D set if SEC has the AES EU (AESU)
> +        bit 7  =3D set if SEC has the Kasumi EU (KEU)
> +        bit 8  =3D set if SEC has the CRC EU (CRCU)
> +        bit 11 =3D set if SEC has the message digest EU extended alg set=
 (MDEU-B)
> +
> +      remaining bits are reserved for future SEC EUs.
> +
> +  fsl,descriptor-types-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The bitmask representing what descriptors are available. Descripto=
r type
> +      information should be encoded following the SEC's Descriptor Heade=
r Dword
> +      DESC_TYPE field documentation, i.e. as follows:
> +
> +        bit 0  =3D set if SEC supports the aesu_ctr_nonsnoop desc. type
> +        bit 1  =3D set if SEC supports the ipsec_esp descriptor type
> +        bit 2  =3D set if SEC supports the common_nonsnoop desc. type
> +        bit 3  =3D set if SEC supports the 802.11i AES ccmp desc. type
> +        bit 4  =3D set if SEC supports the hmac_snoop_no_afeu desc. type
> +        bit 5  =3D set if SEC supports the srtp descriptor type
> +        bit 6  =3D set if SEC supports the non_hmac_snoop_no_afeu desc.t=
ype
> +        bit 7  =3D set if SEC supports the pkeu_assemble descriptor type
> +        bit 8  =3D set if SEC supports the aesu_key_expand_output desc.t=
ype
> +        bit 9  =3D set if SEC supports the pkeu_ptmul descriptor type
> +        bit 10 =3D set if SEC supports the common_nonsnoop_afeu desc. ty=
pe
> +        bit 11 =3D set if SEC supports the pkeu_ptadd_dbl descriptor type
> +
> +      ..and so on and so forth.
> +
> +required:
> +  - compatible
> +  - reg
> +  - fsl,num-channels
> +  - fsl,channel-fifo-len
> +  - fsl,exec-units-mask
> +  - fsl,descriptor-types-mask
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    /* MPC8548E */
> +    crypto@30000 {
> +        compatible =3D "fsl,sec2.1", "fsl,sec2.0";
> +        reg =3D <0x30000 0x10000>;
> +        interrupts =3D <29 2>;
> +        interrupt-parent =3D <&mpic>;
> +        fsl,num-channels =3D <4>;
> +        fsl,channel-fifo-len =3D <24>;
> +        fsl,exec-units-mask =3D <0xfe>;
> +        fsl,descriptor-types-mask =3D <0x12b0ebf>;
> +    };
> diff --git a/Documentation/devicetree/bindings/crypto/fsl-sec2.txt b/Docu=
mentation/devicetree/bindings/crypto/fsl-sec2.txt
> deleted file mode 100644
> index 125f155d00d052eec7d5093b5c5076cbe720417f..0000000000000000000000000=
000000000000000
> --- a/Documentation/devicetree/bindings/crypto/fsl-sec2.txt
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -Freescale SoC SEC Security Engines versions 1.x-2.x-3.x
> -
> -Required properties:
> -
> -- compatible : Should contain entries for this and backward compatible
> -  SEC versions, high to low, e.g., "fsl,sec2.1", "fsl,sec2.0" (SEC2/3)
> -                             e.g., "fsl,sec1.2", "fsl,sec1.0" (SEC1)
> -    warning: SEC1 and SEC2 are mutually exclusive
> -- reg : Offset and length of the register set for the device
> -- interrupts : the SEC's interrupt number
> -- fsl,num-channels : An integer representing the number of channels
> -  available.
> -- fsl,channel-fifo-len : An integer representing the number of
> -  descriptor pointers each channel fetch fifo can hold.
> -- fsl,exec-units-mask : The bitmask representing what execution units
> -  (EUs) are available. It's a single 32-bit cell. EU information
> -  should be encoded following the SEC's Descriptor Header Dword
> -  EU_SEL0 field documentation, i.e. as follows:
> -
> -	bit 0  =3D reserved - should be 0
> -	bit 1  =3D set if SEC has the ARC4 EU (AFEU)
> -	bit 2  =3D set if SEC has the DES/3DES EU (DEU)
> -	bit 3  =3D set if SEC has the message digest EU (MDEU/MDEU-A)
> -	bit 4  =3D set if SEC has the random number generator EU (RNG)
> -	bit 5  =3D set if SEC has the public key EU (PKEU)
> -	bit 6  =3D set if SEC has the AES EU (AESU)
> -	bit 7  =3D set if SEC has the Kasumi EU (KEU)
> -	bit 8  =3D set if SEC has the CRC EU (CRCU)
> -	bit 11 =3D set if SEC has the message digest EU extended alg set (MDEU-=
B)
> -
> -remaining bits are reserved for future SEC EUs.
> -
> -- fsl,descriptor-types-mask : The bitmask representing what descriptors
> -  are available. It's a single 32-bit cell. Descriptor type information
> -  should be encoded following the SEC's Descriptor Header Dword DESC_TYPE
> -  field documentation, i.e. as follows:
> -
> -	bit 0  =3D set if SEC supports the aesu_ctr_nonsnoop desc. type
> -	bit 1  =3D set if SEC supports the ipsec_esp descriptor type
> -	bit 2  =3D set if SEC supports the common_nonsnoop desc. type
> -	bit 3  =3D set if SEC supports the 802.11i AES ccmp desc. type
> -	bit 4  =3D set if SEC supports the hmac_snoop_no_afeu desc. type
> -	bit 5  =3D set if SEC supports the srtp descriptor type
> -	bit 6  =3D set if SEC supports the non_hmac_snoop_no_afeu desc.type
> -	bit 7  =3D set if SEC supports the pkeu_assemble descriptor type
> -	bit 8  =3D set if SEC supports the aesu_key_expand_output desc.type
> -	bit 9  =3D set if SEC supports the pkeu_ptmul descriptor type
> -	bit 10 =3D set if SEC supports the common_nonsnoop_afeu desc. type
> -	bit 11 =3D set if SEC supports the pkeu_ptadd_dbl descriptor type
> -
> -  ..and so on and so forth.
> -
> -Example:
> -
> -	/* MPC8548E */
> -	crypto@30000 {
> -		compatible =3D "fsl,sec2.1", "fsl,sec2.0";
> -		reg =3D <0x30000 0x10000>;
> -		interrupts =3D <29 2>;
> -		interrupt-parent =3D <&mpic>;
> -		fsl,num-channels =3D <4>;
> -		fsl,channel-fifo-len =3D <24>;
> -		fsl,exec-units-mask =3D <0xfe>;
> -		fsl,descriptor-types-mask =3D <0x12b0ebf>;
> -	};
>
> --
> 2.48.0.rc1.219.gb6b6757d772
>
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
